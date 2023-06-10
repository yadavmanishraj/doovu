import 'package:flutter/material.dart';

class CustomAppbar extends AppBar {
  CustomAppbar({super.key, Widget? title, List<Widget>? actions})
      : super(
            title: title,
            actions: actions,
            elevation: 0,
            centerTitle: true,
            backgroundColor: Colors.transparent);
}
