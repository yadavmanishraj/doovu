import 'package:doovu/app/theme.dart';
import 'package:doovu/data/models/task_category.dart';
import 'package:doovu/shared/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

extension on String {
  Color get color => Color(int.parse(this));
}

class AppChip extends StatelessWidget {
  const AppChip({
    super.key,
    required this.child,
    this.filled = true,
    this.color = primaryColor,
    this.onClick,
  });

  final Widget child;
  final bool filled;
  final Color color;
  final VoidCallback? onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 8),
          height: 32,
          decoration: BoxDecoration(
              color: filled ? color : null,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color: !filled ? primaryColor : Colors.transparent,
              )),
          child: child),
    );
  }
}

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    super.key,
    required this.category,
  });

  final TaskCategory category;
  @override
  Widget build(BuildContext context) {
    return AppChip(
        color: category.color.color,
        child: Row(children: [
          SizedBox(width: 16, child: SvgIcon('assets/icons/${category.icon}')),
          const SizedBox(width: 4),
          Text(category.label)
        ]));
  }
}

class PriorityChip extends StatelessWidget {
  const PriorityChip({super.key, required this.priority});
  final int priority;

  @override
  Widget build(BuildContext context) {
    return AppChip(
      child: Row(children: [
        const SizedBox(height: 16, child: SvgIcon("assets/icons/flag.svg")),
        Text(
          priority.toString(),
        )
      ]),
    );
  }
}
