import 'package:doovu/shared/widgets/svg_icon.dart';
import 'package:flutter/material.dart';

class TaskIconButton<T> extends StatelessWidget {
  const TaskIconButton(
      {super.key,
      required this.icon,
      this.padding,
      this.color,
      this.onClick,
      this.value});
  final String icon;
  final ValueChanged<T?>? onClick;
  final T? value;
  final Color? color;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onClick != null) {
          onClick!(value);
        }
      },
      child: Container(
        height: 60,
        width: 60,
        padding: padding ?? const EdgeInsets.all(14),
        decoration: BoxDecoration(
            color: color ?? const Color.fromARGB(114, 53, 53, 53),
            borderRadius: BorderRadius.circular(10)),
        child: SvgIcon(icon),
      ),
    );
  }
}
