import 'package:json_annotation/json_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'task_category.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class TaskCategory {
  @HiveField(0)
  final String color;
  @HiveField(1)
  final String label;
  @HiveField(2)
  final String icon;
  @HiveField(3)
  final String id;

  const TaskCategory(
      {required this.color,
      required this.label,
      required this.icon,
      required this.id});

  factory TaskCategory.onlyId(String id) {
    return TaskCategory(color: 'color', label: 'label', icon: 'icon', id: id);
  }

  factory TaskCategory.fromJson(Map<String, dynamic> json) =>
      _$TaskCategoryFromJson(json);

  Map<String, dynamic> toJson() => _$TaskCategoryToJson(this);
}
