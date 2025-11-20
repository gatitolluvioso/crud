import 'package:equatable/equatable.dart';

import '../model/student_model.dart';
//part of '../bloc/student_bloc.dart';

abstract class StudenEvent extends Equatable {
  const StudenEvent();

  @override
  List<Object> get props => [];
}

class CreateStudent extends StudenEvent {
  final Student? student;

  CreateStudent(this.student);

  @override
  List<Object> get props => [];
}

class ReadStudent extends StudenEvent {

  @override
  List<Object> get props => [];
}

class UpdateStudent extends StudenEvent {
  final Student? student;

  const UpdateStudent(this.student);

  @override
  List<Object> get props => [];
}

class DeleteStudent extends StudenEvent {
  final int? id;

  const DeleteStudent(this.id);

  @override
  List<Object> get props => [id!];
}
