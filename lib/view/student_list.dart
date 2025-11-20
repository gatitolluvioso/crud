import 'package:crud/bloc/student_bloc.dart';
import 'package:crud/state/student_state.dart';
import 'package:crud/view/widget_empty_list.dart';
import 'package:crud/view/widget_error.dart';
import 'package:crud/view/widget_filled_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StudentList extends StatelessWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StudentBloc, StudenState>(
      builder: (context, state) {
        if (state is StudentInitial || state is StudentLoading){
          return CircularProgressIndicator();
        }
        if (state is StudentError) {
          //downcasting
          //final error = state;
          return WidgetError(message: state.message );
        }
        if (state is StudentLoaded) {
          if (state.students == null){
            return WidgetEmptyList();
          }else{
            if (state.students!.isEmpty){
              return WidgetEmptyList();

            }else{
              return WidgetFilledList(students: state.students);
            }
          }
        }  
        return Container();
      },
    );
  }
}
