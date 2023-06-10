import 'package:doovu/auth/bloc/auth_bloc.dart';
import 'package:doovu/home/view/home_page.dart';
import 'package:doovu/onboarding/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  static const route = "/";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (!state.isLoading) {
            if (state.user != null) {
              GoRouter.of(context).pushReplacement(HomePage.route);
            } else {
              GoRouter.of(context).pushReplacement(OnboardingScreen.route);
            }
          }
        },
        child: Center(
          child: SvgPicture.asset("assets/illustration/splash.svg"),
        ),
      ),
    );
  }
}
