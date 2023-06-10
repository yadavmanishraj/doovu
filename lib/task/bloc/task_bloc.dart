import 'dart:async';
import 'dart:developer';

import 'package:doovu/domain/task_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doovu/data/data.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  final TaskRepository _taskRepository;

  TaskBloc(this._taskRepository)
      : super(const TaskState(tasks: [], isLoading: true)) {
    on<TaskInitializedEvent>(_onTaskInitialized);
    on<NewTaskAdded>(_onNewTaskAdded);

    add(TaskInitializedEvent());
  }

  FutureOr<void> _onTaskInitialized(
      TaskInitializedEvent event, Emitter<TaskState> emit) async {
    try {
      var tasks = await _taskRepository.getTasks();
      emit(state.copyWith(tasks: tasks, isLoading: false));

      _taskRepository.taskStream.listen((event) {
        add(NewTaskAdded(taskModel: event));
      });
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
    } finally {
      emit(state.copyWith(isLoading: false));
    }
  }

  FutureOr<void> _onNewTaskAdded(NewTaskAdded event, Emitter<TaskState> emit) {
    emit(state.copyWith(tasks: event.taskModel));
  }
}
