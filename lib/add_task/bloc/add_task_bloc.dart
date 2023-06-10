import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'package:doovu/data/data.dart';
import 'package:doovu/domain/task_repository.dart';

part 'add_task_event.dart';
part 'add_task_state.dart';

class AddTaskBloc extends Bloc<AddTaskEvent, AddTaskState> {
  TaskRepository taskRepository;
  AddTaskBloc(this.taskRepository) : super(const AddTaskState(priority: 0)) {
    on<AddTaskPutRequested>(_onTaskPutRequested);
  }

  FutureOr<void> _onTaskPutRequested(
      AddTaskPutRequested event, Emitter<AddTaskState> emit) {
    taskRepository.addTask(TaskModel(
        id: const Uuid().v1(),
        title: event.title,
        description: event.description,
        category: event.category != null
            ? TaskCategory.onlyId(event.category!)
            : null,
        priority: event.priority,
        taskTime: event.taskTime));
  }
}
