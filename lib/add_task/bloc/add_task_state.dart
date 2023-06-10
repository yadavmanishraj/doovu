// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'add_task_bloc.dart';

class AddTaskState extends Equatable {
  final TaskCategory? taskCategory;
  final String? title;
  final String? description;
  final DateTime? dateTime;
  final int priority;

  const AddTaskState({
    this.taskCategory,
    this.title,
    this.description,
    this.dateTime,
    required this.priority,
  });

  @override
  List<Object> get props => [];

  AddTaskState copyWith({
    TaskCategory? taskCategory,
    String? title,
    String? description,
    DateTime? dateTime,
    int? priority,
  }) {
    return AddTaskState(
      taskCategory: taskCategory ?? this.taskCategory,
      title: title ?? this.title,
      description: description ?? this.description,
      dateTime: dateTime ?? this.dateTime,
      priority: priority ?? this.priority,
    );
  }
}
