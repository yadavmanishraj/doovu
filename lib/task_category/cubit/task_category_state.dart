// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'task_category_cubit.dart';

class TaskCategoryState extends Equatable {
  final List<TaskCategory> taskCategories;
  final bool isLoading;
  const TaskCategoryState({
    this.taskCategories = const [],
    this.isLoading = true,
  });
  @override
  List<Object> get props => [];

  

  TaskCategoryState copyWith({
    List<TaskCategory>? taskCategories,
    bool? isLoading,
  }) {
    return TaskCategoryState(
      taskCategories: taskCategories ?? this.taskCategories,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
