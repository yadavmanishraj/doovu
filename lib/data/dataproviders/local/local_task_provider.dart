import 'dart:async';

import 'package:doovu/app/constants.dart';
import 'package:doovu/data/data.dart';
import 'package:hive_flutter/hive_flutter.dart';

class LocalTaskProvider {
  LocalTaskProvider() {
    init();
  }

  late final StreamController<List<TaskModel>> _taskStreamController;
  late final Box<TaskModel> box;

  init() {
    _taskStreamController = StreamController.broadcast();
    box = Hive.box<TaskModel>(tasksBox);
  }

  // void addTasks(List<TaskModel> tasks) {
  //   box.clear();
  //   box.putAll(tasks.asMap().map((key, value) => {value.id: value}));
  //   _taskStreamController.add(tasks);
  // }

  // void addTask(TaskModel task) {
  //   box.add(value)
  // }
}
