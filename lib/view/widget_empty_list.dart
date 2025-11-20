import 'package:crud/view/widget_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WidgetEmptyList extends StatelessWidget {
  const WidgetEmptyList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.error, size: 40, color: Colors.redAccent),
          SizedBox(height: 10),
          Text(
            "La lista está vacía",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 10),
          CupertinoButton.filled(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            color: CupertinoColors.systemYellow,
            child: Icon(Icons.add),
            onPressed: () {
                WidgetForm.show(context);
            },
          ),
        ],
      ),
    );
    ;
  }
}
