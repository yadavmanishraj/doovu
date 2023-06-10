import 'package:flutter/material.dart';

class AppContainer extends StatelessWidget {
  const AppContainer(
      {super.key, this.color, required this.child, this.boxDecoration});
  final Widget child;
  final BoxDecoration? boxDecoration;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: boxDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: color,
            ),
        child: child);
  }
}
