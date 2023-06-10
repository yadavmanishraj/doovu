// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<TaskModel> tasks;
  final bool isLoading;

  const TaskState({
    required this.tasks,
    required this.isLoading,
  });

  @override
  List<Object> get props => [tasks, isLoading];

  TaskState copyWith({
    List<TaskModel>? tasks,
    bool? isLoading,
  }) {
    return TaskState(
      tasks: tasks ?? this.tasks,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
