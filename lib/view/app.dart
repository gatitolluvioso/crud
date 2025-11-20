import 'package:crud/bloc/student_bloc.dart';
import 'package:crud/event/student_event.dart';
import 'package:crud/service/database_helper.dart';
import 'package:crud/view/home.dart';
import 'package:crud/view/student_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/student_bloc.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "imgroot",
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: Colors.blue,
        appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
      ),
      home: BlocProvider(
        create: (context) {
          final bloc = StudentBloc(DatabaseHelper.instance);
          bloc.add(ReadStudent());
          return bloc;
        },
        child: const Home(),
      ),
    );
  }
}
