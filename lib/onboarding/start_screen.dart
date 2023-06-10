import 'package:doovu/auth/view/login_screen.dart';
import 'package:doovu/auth/view/register_screen.dart';
import 'package:doovu/shared/widgets/app_button.dart';
import 'package:doovu/shared/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  static const route = "/start_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const PrimaryText(
              "Welcome to UpTodo",
            ),
            const SizedBox(height: 24),
            const Text(
              "Please login to your account or create new account to continue",
              textAlign: TextAlign.center,
            ),
            Expanded(
                child: Center(
                    child: SizedBox(
              height: 200,
              child: SvgPicture.asset("assets/illustration/getstarted.svg"),
            ))),
            AppButton(
              text: "LOGIN",
              onClick: () {
                GoRouter.of(context).push(LoginScreen.route);
              },
            ),
            const SizedBox(height: 8),
            BorderedAppButton(
              text: "CREATE ACCOUNT",
              onClick: () {
                GoRouter.of(context).push(RegisterScreen.route);
              },
            )
          ],
        ),
      ),
    );
  }
}
