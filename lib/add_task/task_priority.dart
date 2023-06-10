import 'package:doovu/app/theme.dart';
import 'package:doovu/shared/widgets/app_button.dart';
import 'package:doovu/shared/widgets/app_dialog.dart';
import 'package:doovu/shared/widgets/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<T?> showTaskPriorityDialog<T>(BuildContext context) {
  return showDialog<T>(
    context: context,
    builder: (context) => const AppDialog(
      title: "Task Priority",
      widget: TaskPriorityContainer(),
    ),
  );
}

class TaskPriorityContainer extends StatefulWidget {
  const TaskPriorityContainer({
    super.key,
  });

  @override
  State<TaskPriorityContainer> createState() => _TaskPriorityContainerState();
}

class _TaskPriorityContainerState extends State<TaskPriorityContainer> {
  int? index;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 210,
          child: GridView.count(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            children: [
              TaskPriorityButton(
                isSelected: index == 1,
                index: 1,
                onTap: changePriority,
              ),
              TaskPriorityButton(
                isSelected: index == 2,
                index: 2,
                onTap: changePriority,
              ),
              TaskPriorityButton(
                isSelected: index == 3,
                index: 3,
                onTap: changePriority,
              ),
              TaskPriorityButton(
                isSelected: index == 4,
                index: 4,
                onTap: changePriority,
              ),
              TaskPriorityButton(
                isSelected: index == 5,
                index: 5,
                onTap: changePriority,
              ),
              TaskPriorityButton(
                isSelected: index == 6,
                index: 6,
                onTap: changePriority,
              ),
              TaskPriorityButton(
                isSelected: index == 7,
                index: 7,
                onTap: changePriority,
              ),
              TaskPriorityButton(
                isSelected: index == 8,
                index: 8,
                onTap: changePriority,
              ),
              TaskPriorityButton(
                isSelected: index == 9,
                index: 9,
                onTap: changePriority,
              ),
            ],
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
                GoRouter.of(context).pop(index);
              },
            ))
          ],
        )
      ],
    );
  }

  void changePriority(index) {
    setState(() {
      if (this.index == index) {
        return this.index = null;
      }
      this.index = index;
    });
  }
}

class TaskPriorityButton extends StatelessWidget {
  const TaskPriorityButton({
    super.key,
    this.isSelected = false,
    required this.index,
    required this.onTap,
  });
  final bool isSelected;
  final int index;
  final ValueChanged onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap(index);
      },
      child: Container(
        height: 70,
        width: 70,
        decoration: BoxDecoration(
            color: isSelected ? primaryColor : Colors.black,
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SvgIcon("assets/icons/flag.svg"),
            const SizedBox(height: 8),
            Text(index.toString())
          ],
        ),
      ),
    );
  }
}
