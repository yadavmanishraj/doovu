import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

@immutable
class SvgIcon extends StatelessWidget {
  const SvgIcon(this.icon, {super.key, this.color});
  final String icon;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.loose(const Size.fromHeight(40)),
      child: SvgPicture.asset(
        icon,
        color: color,
      ),
    );
  }
}

class SvgIconButton extends IconButton {
  SvgIconButton(
      {super.key, required super.onPressed, required String icon, Color? color})
      : super(icon: SvgIcon(icon, color: color,));
}
