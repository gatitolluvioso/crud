import 'package:crud/view/student_list.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 4,
        title: Text("CRUD", style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),)
      ),
      body: StudentList(),
    );
  }
}
