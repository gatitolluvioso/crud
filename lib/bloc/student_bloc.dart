//import 'package:crud/event/student_event.dart';
//import 'package:crud/state/student_state.dart';
import 'dart:async';
import 'package:crud/model/student_model.dart';
import 'package:crud/service/database_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
import '../event/student_event.dart';
import '../state/student_state.dart';

class StudentBloc extends Bloc<StudenEvent, StudenState> {
  final DatabaseHelper? dbHelper;

  StudentBloc(this.dbHelper) : super(StudentInitial()) {
    on<CreateStudent>(createStudents);
    on<ReadStudent>(readStudents);
    on<UpdateStudent>(updateStudents);
    on<DeleteStudent>(deleteStudents);
  }

  FutureOr<void> createStudents(
    CreateStudent event,
    Emitter<StudenState> emit,
  ) async {
    try {
      //agregarlo a la base de datos
      await dbHelper?.create(event.student!);
      add(ReadStudent());
    } catch (e) {
      StudentError(
        message: "Error, no se pudo agregar el/la/elle/ellx estudihambre 😓😓",
      );
      add(ReadStudent());
    }
  }

  FutureOr<void> readStudents(
    ReadStudent event,
    Emitter<StudenState> emit,
  ) async {
    emit(StudentLoading());
    try {
      //consulta a la base de datos
      final students = await dbHelper?.readAll();
      emit(StudentLoaded(students: students));
    } catch (e) {
      emit(
        StudentError(
          message: "Error, no se pudo conectar a la base de datos 😓😓",
        ),
      );
    }
  }

  FutureOr<void> updateStudents(
    UpdateStudent event,
    Emitter<StudenState> emit,
  ) async {
    try {
      //actualizar a la base de datos
      await dbHelper?.update(event.student!);
      add(ReadStudent());
    } catch (e) {
      StudentError(
        message:
            "Error, no se pudo actualizar el/la/elle/ellx estudihambre 😓😓",
      );
      add(ReadStudent());
    }
  }

  FutureOr<void> deleteStudents(
    DeleteStudent event,
    Emitter<StudenState> emit,
  ) async {
    try {
      //borrar de la base de datos
      await dbHelper?.delete(Student(id: event.id));
      add(ReadStudent());
    } catch (e) {
      StudentError(
        message: "Error, no se pudo borrar el/la/elle/ellx estudihambre 😓😓",
      );
      add(ReadStudent());
    }
  }
}
