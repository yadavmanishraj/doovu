import 'package:doovu/app/theme.dart';
import 'package:doovu/data/models/task_category.dart';
import 'package:doovu/shared/widgets/app_chip.dart';
import 'package:doovu/shared/widgets/container.dart';
import 'package:doovu/shared/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

extension on String {
  Color get color => Color(int.parse(this));
}

class TaskItem extends StatelessWidget {
  const TaskItem(
      {super.key,
      required this.completed,
      required this.text,
      required this.dateTime,
      this.category,
      required this.priority});
  final bool completed;
  final String text;
  final String dateTime;
  final TaskCategory? category;
  final int priority;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(4), color: grey),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.circle_outlined)),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  style: const TextStyle(fontSize: 18),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(dateTime),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        category != null
                            ? AppChip(
                                color: category!.color.color,
                                child: Row(
                                  children: [
                                    SizedBox(
                                        height: 16,
                                        child: SvgIcon(
                                            "assets/icons/${category!.icon}")),
                                    Text(category!.label)
                                  ],
                                ))
                            : const AppChip(
                                child: Text("Uncategorized"),
                              ),
                        const SizedBox(width: 8),
                        AppChip(
                          child: Row(children: [
                            const SvgIcon("assets/icons/flag.svg"),
                            const SizedBox(width: 4),
                            Text(priority.toString())
                          ]),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TaskCategoryLabel extends StatelessWidget {
  const TaskCategoryLabel(
      {super.key, required this.icon, required this.category, this.color});
  final Widget icon;
  final String category;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 32,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: color ?? Colors.green.withOpacity(.2)),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [icon, Text(category)],
          ),
        ),
        const SizedBox(width: 8),
        const PriorityWidget(priority: 1)
      ],
    );
  }
}

class PriorityWidget extends StatelessWidget {
  const PriorityWidget({super.key, required this.priority});
  final int priority;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: primaryColor)),
      child: Row(
        children: [
          const SizedBox(height: 16, child: SvgIcon("assets/icons/flag.svg")),
          Text(priority.toString())
        ],
      ),
    );
  }
}

class AnotherTaskItem extends StatelessWidget {
  const AnotherTaskItem(
      {super.key,
      required this.title,
      this.description,
      this.taskDate,
      required this.priority,
      this.taskCategory,
      this.onComplete});

  final String title;
  final String? description;
  final String? taskDate;
  final int priority;
  final TaskCategory? taskCategory;
  final VoidCallback? onComplete;

  @override
  Widget build(BuildContext context) {
    return AppContainer(
      color: const Color(0xFF363636),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Center(
            child: Icon(Icons.circle_outlined),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    Text(
                      taskDate ?? "",
                      style: const TextStyle(color: Colors.grey),
                    )
                  ],
                ),
                const SizedBox(height: 8),
                description != null
                    ? Row(
                        children: [
                          Expanded(
                            child: Text(
                              description!,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const SizedBox(width: 4),
                    taskCategory != null
                        ? CategoryChip(category: taskCategory!)
                        : const SizedBox.shrink(),
                    const SizedBox(width: 4),
                    PriorityChip(priority: priority)
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
