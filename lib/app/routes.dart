import 'package:doovu/auth/view/login_screen.dart';
import 'package:doovu/auth/view/register_screen.dart';
import 'package:doovu/home/view/home_page.dart';
import 'package:doovu/onboarding/onboarding_screen.dart';
import 'package:doovu/onboarding/splash_screen.dart';
import 'package:doovu/onboarding/start_screen.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  routes: [
    GoRoute(
      path: SplashScreen.route,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: HomePage.route,
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: OnboardingScreen.route,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: StartScreen.route,
      builder: (context, state) => const StartScreen(),
    ),
    GoRoute(
      path: LoginScreen.route,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: RegisterScreen.route,
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);
