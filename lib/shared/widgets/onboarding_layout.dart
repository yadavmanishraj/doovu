import 'package:doovu/shared/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingLayout extends StatelessWidget {
  const OnboardingLayout({
    super.key,
    required this.index,
    required this.primaryText,
    required this.secondaryText,
    required this.illustration,
  });

  final int index;
  final String primaryText;
  final String secondaryText;
  final String illustration;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset("assets/illustration/$illustration"),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.remove,
              color: index == 0 ? Colors.white : Colors.grey,
            ),
            Icon(
              Icons.remove,
              color: index == 1 ? Colors.white : Colors.grey,
            ),
            Icon(
              Icons.remove,
              color: index == 2 ? Colors.white : Colors.grey,
            )
          ],
        ),
        const SizedBox(height: 32),
        PrimaryText(primaryText),
        const SizedBox(height: 32),
        Text(
          secondaryText,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
