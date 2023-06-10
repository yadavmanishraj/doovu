import 'package:doovu/app/constants.dart';
import 'package:doovu/data/data.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<void> hiveInit() async {
  await Hive.initFlutter();
  Hive.openLazyBox<TaskModel>(tasksBox);
  Hive.openLazyBox<TaskCategory>(taskCategoryBox);
  // Hive.openLazyBox(currentUserBox);
}
