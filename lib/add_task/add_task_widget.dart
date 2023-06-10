import 'dart:developer';

import 'package:doovu/add_task/bloc/add_task_bloc.dart';
import 'package:doovu/add_task/task_priority.dart';
import 'package:doovu/app/locator.dart';
import 'package:doovu/app/theme.dart';
import 'package:doovu/data/data.dart';
import 'package:doovu/domain/task_repository.dart';
import 'package:doovu/shared/widgets/app_chip.dart';
import 'package:doovu/shared/widgets/svg_icon.dart';
import 'package:doovu/task_category/task_category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

extension on DateTime {
  String format() {
    return "$year-$month-$day::$hour:$minute:$second";
  }
}

extension on String {
  Color get color => Color(int.parse(this));
}

class AddTaskWidget extends StatelessWidget {
  const AddTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AddTaskBloc(locator.get<TaskRepository>()),
        child: const AddTaskView());
  }
}

class AddTaskView extends StatefulWidget {
  const AddTaskView({super.key});

  @override
  State<AddTaskView> createState() => _AddTaskViewState();
}

class _AddTaskViewState extends State<AddTaskView> {
  TaskCategory? taskCategory;
  String? title;
  String? description;
  DateTime? taskDateTime;
  int priority = 0;

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Add Task",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 16),
          TextFormField(
            validator: titleValidator,
            controller: titleController,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), isDense: true, hintText: "Title"),
          ),
          TextField(
            controller: descriptionController,
            maxLines: 5,
            minLines: 1,
            decoration: const InputDecoration(
                hintText: "Description", border: InputBorder.none),
          ),
          SizedBox(
            height: 32,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                taskDateTime != null
                    ? AppChip(
                        color: Colors.green,
                        child: Text("${taskDateTime?.format()}"),
                      )
                    : const SizedBox(),
                const SizedBox(width: 8),
                taskCategory != null
                    ? CategoryChip(category: taskCategory!)
                    : const SizedBox(),
                const SizedBox(width: 8),
                priority != 0
                    ? PriorityChip(priority: priority)
                    : const SizedBox()
              ],
            ),
          ),
          Row(
            children: [
              SvgIconButton(
                onPressed: () {
                  addDateTime(context);
                },
                icon: "assets/icons/timer.svg",
                color: taskDateTime != null ? Colors.green : null,
              ),
              const SizedBox(width: 16),
              SvgIconButton(
                onPressed: () {
                  addCategory(context);
                },
                icon: "assets/icons/tag.svg",
                color: taskCategory?.color.color,
              ),
              const SizedBox(width: 16),
              SvgIconButton(
                onPressed: () {
                  addPriority(context);
                },
                icon: "assets/icons/flag.svg",
                color: priority != 0 ? primaryColor : null,
              ),
              const Expanded(child: SizedBox()),
              SvgIconButton(
                  onPressed: () {
                    addTask();
                    GoRouter.of(context).pop();
                  },
                  icon: "assets/icons/send.svg"),
            ],
          )
        ],
      ),
    );
  }

  void addDateTime(BuildContext context) async {
    var dateTime = await showDatePicker(
            confirmText: "CHOOSE TIME",
            initialEntryMode: DatePickerEntryMode.input,
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime(3000))
        .then((date) async {
      var time = await showTimePicker(
          initialEntryMode: TimePickerEntryMode.input,
          context: context,
          initialTime: TimeOfDay.now());
      log(date!.toIso8601String());

      if (time != null) {
        return DateTime(
            date.year, date.month, date.day, time.hour, time.minute);
      }
    });

    setState(() {
      taskDateTime = dateTime;
    });
  }

  void addPriority(BuildContext context) async {
    var data = await showTaskPriorityDialog<int?>(context);
    if (data != null) {
      setState(() {
        priority = data;
      });
    }
  }

  void addCategory(BuildContext context) async {
    var data = await showTaskCategoryDialog<TaskCategory>(context);
    setState(() {
      taskCategory = data;
    });
  }

  Future<void> addTask() async {
    if (formKey.currentState?.validate() ?? false) {
      context.read<AddTaskBloc>().add(AddTaskPutRequested(
          title: titleController.text,
          category: taskCategory?.id,
          description: descriptionController.text,
          taskTime: taskDateTime,
          priority: priority));
    }
  }

  String? titleValidator(String? title) {
    if (title == null || title.trim().isEmpty) {
      return "Title must be present";
    }
    return null;
  }
}

// class AppChip extends StatelessWidget {
//   const AppChip({super.key, required this.child, this.color = primaryColor});
//   final Widget? child;
//   final Color? color;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 32,
//       alignment: Alignment.center,
//       padding: const EdgeInsets.symmetric(horizontal: 8),
//       decoration: BoxDecoration(
//           color:
//               color?.withOpacity(.9) ?? const Color.fromARGB(255, 90, 90, 90),
//           borderRadius: BorderRadius.circular(4)),
//       child: child,
//     );
//   }
// }
