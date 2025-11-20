import 'package:crud/bloc/student_bloc.dart';
import 'package:crud/event/student_event.dart';
import 'package:crud/model/student_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetForm {
  static void show(BuildContext context) async {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController ageController = TextEditingController();
    final bloc = context.read<StudentBloc>();

    await showDialog<void>(
      context: context,
      barrierDismissible: true,
      // false = user must tap button, true = tap outside dialog
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Agregar Estudihambre'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: TextField(
                  controller: nameController,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre',
                  ),
                ),
              ),

              SizedBox(height: 10),
              Expanded(
                child: TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Edad',
                  ),
                ),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss alert dialog
              },
            ),
            CupertinoButton.filled(
              borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              color: CupertinoColors.systemYellow,
              child: Text("Agregar"),
              onPressed: () {
                if (nameController.text.isNotEmpty ||
                    ageController.text.isNotEmpty) {
                  bloc.add(
                    CreateStudent(
                      Student(
                        name: nameController.text,
                        age: int.tryParse(ageController.text) ?? 0,
                      ),
                    ),
                  );
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                } else {
                  Navigator.of(dialogContext).pop(); // Dismiss alert dialog
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Los campos no deben de ser vacios"),
                    ),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }
}
