import 'package:crud/model/student_model.dart';
import 'package:equatable/equatable.dart';
//part of '../bloc/student_bloc.dart';

abstract class StudenState extends Equatable {
  @override
  List<Object> get props => [];
}

final class StudentInitial extends StudenState {}

final class StudentLoading extends StudenState {}

final class StudentLoaded extends StudenState {
  final List<Student>? students;
  final bool? order;

  StudentLoaded({this.students, this.order});

  StudentLoaded copyWith({List<Student>? students, bool? order}) {
    return StudentLoaded(
      students: students ?? this.students,
      order: order ?? this.order,
    );
  }

  @override
  List<Object> get props => [students!, order!];
}

final class StudentError extends StudenState {
  final String? message;

  StudentError({this.message});

  @override
  List<Object> get props => [message!];
}
