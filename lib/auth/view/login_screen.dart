import 'package:doovu/app/locator.dart';
import 'package:doovu/auth/bloc/auth_bloc.dart';
import 'package:doovu/auth/view/register_screen.dart';
import 'package:doovu/home/view/home_page.dart';
import 'package:doovu/shared/widgets/app_bar.dart';
import 'package:doovu/shared/widgets/app_button.dart';
import 'package:doovu/shared/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const route = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.user != null) {
          GoRouter.of(context).pushReplacement(HomePage.route);
        }
      },
      child: Scaffold(
        appBar: CustomAppbar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            // physics: const BouncingScrollPhysics(),
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 42),
              const PrimaryText("Login"),
              const SizedBox(height: 42),
              const SizedBox(height: 16),
              TextFormField(
                controller: emailController,
                decoration: _buildDecoration(
                    hintText: "e.g. example@gmail.com", labelText: "Email"),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: _buildDecoration(labelText: "Password"),
              ),
              const SizedBox(height: 34),
              AppButton(
                text: "LOGIN",
                onClick: login,
              ),
              const SizedBox(height: 16),
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      "or",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Expanded(child: Divider())
                ],
              ),
              const SizedBox(height: 16),
              BorderedAppButton(
                  onClick: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                          height: 16,
                          child: SvgPicture.asset("assets/icons/google.svg")),
                      const SizedBox(width: 2),
                      const Text("Login with Google")
                    ],
                  )),
              const SizedBox(height: 16),
              BorderedAppButton(
                onClick: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 24,
                        child: SvgPicture.asset("assets/icons/apple.svg")),
                    const SizedBox(width: 2),
                    const Text("Login with Apple")
                  ],
                ),
              ),
              const Expanded(child: SizedBox()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don’t have an account? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  InkWell(
                      onTap: () {
                        GoRouter.of(context).go(RegisterScreen.route);
                      },
                      child: const Text("Register"))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _buildDecoration({String? hintText, String? labelText}) {
    return InputDecoration(
        hintText: hintText,
        labelText: labelText,
        border: const OutlineInputBorder());
  }

  void login() {
    var email = emailController.text.trim();
    var password = passwordController.text.trim();

    var authBloc = locator.get<AuthBloc>();

    authBloc.add(AuthEventLoginRequested(email: email, password: password));
  }
}
