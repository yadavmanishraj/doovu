// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModelAdapter extends TypeAdapter<TaskModel> {
  @override
  final int typeId = 2;

  @override
  TaskModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModel(
      title: fields[0] as String,
      description: fields[1] as String?,
      taskTime: fields[2] as DateTime?,
      category: fields[3] as TaskCategory?,
      priority: fields[4] as int,
      id: fields[5] as String,
      status: fields[6] as TaskStatus,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.description)
      ..writeByte(2)
      ..write(obj.taskTime)
      ..writeByte(3)
      ..write(obj.category)
      ..writeByte(4)
      ..write(obj.priority)
      ..writeByte(5)
      ..write(obj.id)
      ..writeByte(6)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TaskStatusAdapter extends TypeAdapter<TaskStatus> {
  @override
  final int typeId = 3;

  @override
  TaskStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return TaskStatus.initial;
      case 1:
        return TaskStatus.progress;
      case 2:
        return TaskStatus.completed;
      case 3:
        return TaskStatus.deleted;
      default:
        return TaskStatus.initial;
    }
  }

  @override
  void write(BinaryWriter writer, TaskStatus obj) {
    switch (obj) {
      case TaskStatus.initial:
        writer.writeByte(0);
        break;
      case TaskStatus.progress:
        writer.writeByte(1);
        break;
      case TaskStatus.completed:
        writer.writeByte(2);
        break;
      case TaskStatus.deleted:
        writer.writeByte(3);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskModel _$TaskModelFromJson(Map<String, dynamic> json) => TaskModel(
      title: json['title'] as String,
      description: json['description'] as String?,
      taskTime: json['taskTime'] == null
          ? null
          : DateTime.parse(json['taskTime'] as String),
      category: json['category'] == null
          ? null
          : TaskCategory.fromJson(json['category'] as Map<String, dynamic>),
      priority: json['priority'] as int,
      id: json['id'] as String,
      status: $enumDecodeNullable(_$TaskStatusEnumMap, json['status']) ??
          TaskStatus.initial,
    );

Map<String, dynamic> _$TaskModelToJson(TaskModel instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'taskTime': instance.taskTime?.toIso8601String(),
      'category': instance.category,
      'priority': instance.priority,
      'id': instance.id,
      'status': _$TaskStatusEnumMap[instance.status]!,
    };

const _$TaskStatusEnumMap = {
  TaskStatus.initial: 'initial',
  TaskStatus.progress: 'progress',
  TaskStatus.completed: 'completed',
  TaskStatus.deleted: 'deleted',
};
