import 'dart:async';

import 'package:appwrite/appwrite.dart';
import 'package:doovu/data/dataproviders/task_category_provider.dart';
import 'package:doovu/data/models/task_category.dart';
import 'package:doovu/data/models/task_model.dart';
import 'package:doovu/data/secrets.dart';

class TaskProvider {
  TaskProvider(Client client)
      : _databases = Databases(client),
        _realtime = Realtime(client),
        _taskCategoryProvider = TaskCategoryProvider(client) {
    _init();
  }

  final Databases _databases;
  final Realtime _realtime;
  final TaskCategoryProvider _taskCategoryProvider;

  late final StreamController<RealtimeMessage> _taskStreamController;
  late final StreamController<List<TaskModel>> _tasksStreamController;

  Stream<RealtimeMessage> get taskStream => _taskStreamController.stream;

  Stream<List<TaskModel>> get tasksStream => _tasksStreamController.stream;

  _init() async {
    _taskStreamController = StreamController.broadcast();
    _tasksStreamController = StreamController.broadcast();

    var sub = _realtime.subscribe(
        ['databases.$databaseId.collections.$taskCollectionId.documents']);
    sub.stream.listen((event) async {
      _taskStreamController.sink.add(event);
      _tasksStreamController.add(await getTasks());
    });

    _tasksStreamController.add(await getTasks());
  }

  TaskModel _parseTask(Map<String, dynamic> json) {
    TaskCategory? category =
        _taskCategoryProvider.getTaskCategory(json['category']);
    return TaskModel.fromJson({...json, 'category': category?.toJson()});
  }

  createTask(TaskModel taskModel) {
    _databases.createDocument(
      databaseId: databaseId,
      collectionId: taskCollectionId,
      documentId: ID.unique(),
      data: {...taskModel.toJson(), 'category': taskModel.category?.id},
    );
  }

  Future<List<TaskModel>> getTasks() async {
    var rawDoc = await _databases.listDocuments(
        databaseId: databaseId, collectionId: taskCollectionId);
    return rawDoc.documents.map((e) => _parseTask(e.data)).toList();
  }

  void addTask(TaskModel taskModel, String userId) {
    _databases.createDocument(
        databaseId: databaseId,
        collectionId: taskCollectionId,
        documentId: ID.unique(),
        data: {...taskModel.toJson(), 'category': taskModel.category?.id},
        permissions: [Permission.read(Role.user(userId))]);
  }
}
