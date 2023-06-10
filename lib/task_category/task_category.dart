import 'package:doovu/app/locator.dart';
import 'package:doovu/data/data.dart';
import 'package:doovu/data/dataproviders/task_category_provider.dart';
import 'package:doovu/shared/widgets/app_button.dart';
import 'package:doovu/shared/widgets/app_dialog.dart';
import 'package:doovu/shared/widgets/svg_icon.dart';
import 'package:doovu/task_category/cubit/task_category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

Future<T?> showTaskCategoryDialog<T>(BuildContext context) {
  return showDialog<T>(
    context: context,
    builder: (context) => const AppDialog(
      title: "Task Priority",
      widget: TaskCategoryWidget(),
    ),
  );
}

class TaskCategoryWidget extends StatelessWidget {
  const TaskCategoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          TaskCategoryCubit(locator.get<TaskCategoryProvider>()),
      child: const TaskCategoryContainer(),
    );
  }
}

class TaskCategoryContainer extends StatefulWidget {
  const TaskCategoryContainer({super.key});

  @override
  State<TaskCategoryContainer> createState() => _TaskCategoryContainerState();
}

class _TaskCategoryContainerState extends State<TaskCategoryContainer> {
  TaskCategory? category;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 300,
          child: BlocBuilder<TaskCategoryCubit, TaskCategoryState>(
            builder: (context, state) {
              if (state.isLoading) {}
              if (state.isLoading && state.taskCategories.isEmpty) {}
              var data = state.taskCategories;
              return GridView.builder(
                itemCount: data.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    onClick(data[index]);
                  },
                  child: TaskCategoryButton(
                      label: data[index].label,
                      icon: "assets/icons/${data[index].icon}"),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: AppButton(
              text: "Cancel",
              onClick: GoRouter.of(context).pop,
              filled: false,
            )),
            const SizedBox(width: 16),
            Expanded(
                child: AppButton(
              text: "Save",
              onClick: () {
                GoRouter.of(context).pop(category);
              },
            ))
          ],
        )
      ],
    );
  }

  onClick(TaskCategory taskCategory) {
    setState(() {
      category = taskCategory;
    });
  }
}

class TaskCategoryButton extends StatelessWidget {
  const TaskCategoryButton({
    super.key,
    required this.label,
    required this.icon,
  });
  final String label;
  final String icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          child: Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
                color: const Color.fromARGB(114, 53, 53, 53),
                borderRadius: BorderRadius.circular(10)),
            child: SvgIcon(icon),
          ),
        ),
        const SizedBox(height: 8),
        Text(label)
      ],
    );
  }
}
