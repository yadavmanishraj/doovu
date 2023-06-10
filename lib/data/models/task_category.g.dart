// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_category.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskCategoryAdapter extends TypeAdapter<TaskCategory> {
  @override
  final int typeId = 1;

  @override
  TaskCategory read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskCategory(
      color: fields[0] as String,
      label: fields[1] as String,
      icon: fields[2] as String,
      id: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TaskCategory obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.color)
      ..writeByte(1)
      ..write(obj.label)
      ..writeByte(2)
      ..write(obj.icon)
      ..writeByte(3)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskCategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TaskCategory _$TaskCategoryFromJson(Map<String, dynamic> json) => TaskCategory(
      color: json['color'] as String,
      label: json['label'] as String,
      icon: json['icon'] as String,
      id: json['id'] as String,
    );

Map<String, dynamic> _$TaskCategoryToJson(TaskCategory instance) =>
    <String, dynamic>{
      'color': instance.color,
      'label': instance.label,
      'icon': instance.icon,
      'id': instance.id,
    };
