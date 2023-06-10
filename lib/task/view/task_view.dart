import 'package:doovu/app/locator.dart';
import 'package:doovu/domain/task_repository.dart';
import 'package:doovu/shared/widgets/app_chip.dart';
import 'package:doovu/shared/widgets/svg_icon.dart';
import 'package:doovu/task/bloc/task_bloc.dart';
import 'package:doovu/task/view/task_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(locator.get<TaskRepository>()),
      child: const _TaskView(),
    );
  }
}

class _TaskView extends StatelessWidget {
  const _TaskView();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        if (state.isLoading) return const CircularProgressIndicator();
        return Column(
          children: [
            const SearchInput(),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 16),
                  itemCount: state.tasks.length,
                  itemBuilder: (context, index) => AnotherTaskItem(
                      description: state.tasks[index].description,
                      taskDate: "Today",
                      title: state.tasks[index].title,
                      taskCategory: state.tasks[index].category,
                      priority: state.tasks[index].priority)),
            ),
          ],
        );
      },
    );
  }
}

class SearchInput extends StatelessWidget {
  const SearchInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          prefixIcon: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: SvgIcon("assets/icons/search.svg"),
          ),
          contentPadding: const EdgeInsets.all(16),
          hintText: "Search for your task",
          prefixIconConstraints:
              BoxConstraints.loose(const Size.fromHeight(16)),
          border: const OutlineInputBorder(),
          isDense: true),
    );
  }
}
