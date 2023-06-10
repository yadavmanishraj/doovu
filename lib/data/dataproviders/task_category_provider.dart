import 'package:appwrite/appwrite.dart';
import 'package:doovu/data/secrets.dart';

import '../models/task_category.dart';

class TaskCategoryProvider {
  final Databases _databases;
  late final List<TaskCategory> _taskCategories;

  TaskCategoryProvider(Client client) : _databases = Databases(client) {
    _init();
  }

  createCategory(TaskCategory taskCategory) {
    if (_isThere(taskCategory.id)) return;
    _databases.createDocument(
      databaseId: databaseId,
      collectionId: taskCollectionId,
      documentId: ID.unique(),
      data: taskCategory.toJson(),
    );
  }

  bool _isThere(String id) {
    try {
      _taskCategories.singleWhere((element) => element.id == id);
      return true;
    } on Exception {
      return false;
    }
  }

  TaskCategory? getTaskCategory(String id) {
    try {
      return _taskCategories.singleWhere((element) => element.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<List<TaskCategory>> getTaskCategories() async {
    // if (_taskCategories.isNotEmpty) return _taskCategories;
    var rawDocs = await _databases.listDocuments(
        databaseId: databaseId, collectionId: categoryCollectionId);
    var catories = rawDocs.documents
        .map((e) => TaskCategory.fromJson({...e.data, 'id': e.$id}))
        .toList();
    return catories;
  }

  _init() async {
    var rawDocs = await _databases.listDocuments(
        databaseId: databaseId, collectionId: categoryCollectionId);
    _taskCategories = rawDocs.documents
        .map((e) => TaskCategory.fromJson({...e.data, 'id': e.$id}))
        .toList();
  }
}
