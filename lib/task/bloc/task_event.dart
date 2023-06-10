// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_bloc.dart';

abstract class TaskEvent extends Equatable {
  const TaskEvent();

  @override
  List<Object> get props => [];
}

class TaskInitializedEvent extends TaskEvent {}

class NewTaskAdded extends TaskEvent {
  final List<TaskModel> taskModel;
  const NewTaskAdded({
    required this.taskModel,
  });
}
