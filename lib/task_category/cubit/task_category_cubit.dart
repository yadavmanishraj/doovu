import 'dart:developer';

import 'package:doovu/data/dataproviders/task_category_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doovu/data/data.dart';

part 'task_category_state.dart';

class TaskCategoryCubit extends Cubit<TaskCategoryState> {
  final TaskCategoryProvider _taskCategoryProvider;
  TaskCategoryCubit(this._taskCategoryProvider)
      : super(const TaskCategoryState()) {
    requestTaskCategories();
  }

  void requestTaskCategories() async {
    try {
      var taskCategories = await _taskCategoryProvider.getTaskCategories();
      emit(state.copyWith(taskCategories: taskCategories, isLoading: false));
    } catch (e, stackTrace) {
      log(e.toString());
      log(stackTrace.toString());
      emit(state.copyWith(isLoading: false));
    }
  }
}
