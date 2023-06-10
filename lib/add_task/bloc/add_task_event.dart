// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_task_bloc.dart';

abstract class AddTaskEvent extends Equatable {
  const AddTaskEvent();

  @override
  List<Object> get props => [];
}

class AddTaskPutRequested extends AddTaskEvent {
  final String title;
  final String? description;
  final DateTime? taskTime;
  final String? category;
  final int priority;
  const AddTaskPutRequested({
    required this.title,
    this.description,
    this.taskTime,
    this.category,
    required this.priority,
  });
}
