// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:doovu/data/models/task_category.dart';

part 'task_model.g.dart';

@HiveType(typeId: 3)
@JsonEnum()
enum TaskStatus {
  @HiveField(0)
  @JsonValue("initial")
  initial,
  @HiveField(1)
  @JsonValue("progress")
  progress,
  @HiveField(2)
  @JsonValue("completed")
  completed,
  @HiveField(3)
  @JsonValue("deleted")
  deleted,
}

@HiveType(typeId: 2)
@JsonSerializable()
class TaskModel extends Equatable {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String? description;
  @HiveField(2)
  final DateTime? taskTime;
  @HiveField(3)
  final TaskCategory? category;
  @HiveField(4)
  final int priority;
  @HiveField(5)
  final String id;
  @HiveField(6)
  final TaskStatus status;

  const TaskModel({
    required this.title,
    this.description,
    this.taskTime,
    this.category,
    required this.priority,
    required this.id,
    this.status = TaskStatus.initial,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) =>
      _$TaskModelFromJson(json);

  Map<String, dynamic> toJson() => _$TaskModelToJson(this);

  @override
  List<Object?> get props {
    return [
      title,
      description,
      taskTime,
      category,
      priority,
    ];
  }
}
