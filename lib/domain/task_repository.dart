import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:doovu/auth/services/auth_service.dart';
import 'package:doovu/data/dataproviders/task_provider.dart';
import 'package:doovu/data/models/task_model.dart';

class TaskRepository {
  TaskRepository(Client client)
      : _taskProvider = TaskProvider(client),
        appWriteAuthService = AppWriteAuthService(client);

  final TaskProvider _taskProvider;
  AppWriteAuthService appWriteAuthService;
  late final StreamController<List<TaskModel>> tasksStream;
  late final Stream<RealtimeMessage> realtimeStream;

  String? currentModel;

  init() {
    tasksStream = StreamController.broadcast();
    realtimeStream = _taskProvider.taskStream;

    realtimeStream.listen((event) {
      
    });
  }

  Future<List<TaskModel>> getTasks() async {
    return await _taskProvider.getTasks();
  }

  Stream<List<TaskModel>> get taskStream => _taskProvider.tasksStream;

  Future<void> addTask(TaskModel taskModel) async {
    _taskProvider.addTask(taskModel, appWriteAuthService.user.$id);
  }
}
