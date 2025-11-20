import 'package:crud/bloc/student_bloc.dart';
import 'package:crud/event/student_event.dart';
import 'package:crud/state/student_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path/path.dart';

class WidgetError extends StatelessWidget {
  final String? message;

  const WidgetError({Key? key, this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<StudentBloc>();
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Icon(Icons.error, size: 40, color: Colors.redAccent),
          SizedBox(height: 10),
          Text(
            message!,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 10),
          CupertinoButton.filled(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            color: CupertinoColors.systemYellow,
            child: Icon(Icons.refresh),
            onPressed: () {
              bloc.add(ReadStudent());
            },
          ),
        ],
      ),
    );
  }
}
