import 'package:crud/event/student_event.dart';
import 'package:crud/model/student_model.dart';
import 'package:crud/view/widget_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/student_bloc.dart';

class WidgetFilledList extends StatelessWidget {
  final List<Student>? students;

  const WidgetFilledList({Key? key, this.students}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<StudentBloc>();

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: students?.length,
        prototypeItem: ListTile(
          title: Text(students!.first.name!),
          subtitle: Text(students!.first.age!.toString()),
        ),
        itemBuilder: (context, index) => Card(
          child: Column(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  trailing: Wrap(
                    spacing: 12,
                    children: <Widget>[
                      IconButton(
                        onPressed: () {
                          bloc.add(DeleteStudent(students![index].id!));
                        },
                        icon: Icon(Icons.delete),
                      ),
                      IconButton(onPressed: () {
                        WidgetForm.show(context,students![index]);
                      }, icon: Icon(Icons.edit)),
                    ],
                  ),
                  leading: Icon(Icons.face),
                  title: Text(students![index].name!),
                  subtitle: Text("Edad: ${students![index].age!}"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
