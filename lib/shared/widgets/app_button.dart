import 'package:doovu/app/theme.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton(
      {super.key, required this.text, this.filled = true, this.onClick});
  final String text;
  final VoidCallback? onClick;
  final bool filled;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: const Size(double.infinity, 48),
        backgroundColor: filled ? const Color(0xFF8875FF) : Colors.transparent,
      ),
      onPressed: onClick,
      child: Text(
        text,
        style: TextStyle(color: filled ? Colors.white : primaryColor),
      ),
    );
  }
}

class BorderedAppButton extends StatelessWidget {
  const BorderedAppButton({super.key, this.text, this.onClick, this.child});
  final String? text;
  final VoidCallback? onClick;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        onPressed: onClick,
        style: OutlinedButton.styleFrom(
            fixedSize: const Size.fromHeight(38),
            side: const BorderSide(
              color: primaryColor,
              width: 2,
            )),
        child: child ??
            Text(
              text!,
              style: const TextStyle(color: primaryWhite),
            ));
  }
}
