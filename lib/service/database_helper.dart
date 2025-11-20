import 'dart:async';
import 'dart:io';

import 'package:crud/model/student_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi/windows/sqflite_ffi_setup.dart';

class DatabaseHelper {
  //inicializar bd
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> getDatabase() async {
    if (_database != null) {
      return _database!;
    } else {
      //la bd no esta inicializada
      _database = await initDB("joshua.db");
      return _database!;
    }
  }

  Future<Database?> initDB(String filePath) async {
    String dbPath, path;
    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      sqfliteFfiInit();
      dbPath = await databaseFactoryFfi.getDatabasesPath();
      path = join(dbPath, filePath);

      return await databaseFactoryFfi.openDatabase(
        path,
        options: OpenDatabaseOptions(version: 1, onCreate: onCreate),
      );
    }
    if (Platform.isAndroid || Platform.isIOS || Platform.isFuchsia) {
      dbPath = await getDatabasesPath();
      path = join(dbPath, filePath);
      return await openDatabase(path, version: 1, onCreate: onCreate);
    }
  }

  FutureOr<void> onCreate(Database db, int version) async {
    return await db.execute("""
    CREATE TABLE student(
    id integer primary key not null unique,
    age integer not null,
    name varchar(50) not null
    );
    """);
  }

  //crud : create, read, update, delete
  Future<Student> create(Student student) async {
    final db = await instance.getDatabase();
    int newId = await db.insert("student", student.toMap());
    return Student(id: newId, age: student.age, name: student.name);
  }

  Future<List<Student>> readAll() async {
    final db = await instance.getDatabase();
    final data = await db.query("student");
    return data.map((map) => Student.fromMap(map)).toList(); //Lamda
  }

  Future<int> update(Student student) async {
    final db = await instance.getDatabase();
    return await db.update(
      "student",
      student.toMap(),
      where: 'id=?',
      whereArgs: [student.id],
    );
  }

  Future<int> delete(Student student) async {
    final db = await instance.getDatabase();
    return await db.delete("student", where: "id=?", whereArgs: [student.id]);
  }

  void close()async{
    final db = await instance.getDatabase();
    db.close();
  }
} //end class
