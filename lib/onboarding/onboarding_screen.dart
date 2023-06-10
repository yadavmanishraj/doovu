import 'package:doovu/onboarding/start_screen.dart';
import 'package:doovu/shared/widgets/app_button.dart';
import 'package:doovu/shared/widgets/onboarding_layout.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  static const route = "/onboarding";

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController pageController;

  @override
  initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppButton(
                text: "SKIP",
                filled: false,
                onClick: () {
                  GoRouter.of(context).push(StartScreen.route);
                },
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: changePage,
                  children: const [
                    OnboardingLayout(
                      index: 0,
                      primaryText: "Manage your tasks",
                      secondaryText:
                          "You can easily manage all of your daily tasks in Doovu for free",
                      illustration: "onboarding1.svg",
                    ),
                    OnboardingLayout(
                      index: 1,
                      primaryText: "Create daily routine",
                      secondaryText:
                          "In Doovu  you can create your personalized routine to stay productive",
                      illustration: "onboarding2.svg",
                    ),
                    OnboardingLayout(
                      index: 2,
                      primaryText: "Orgonaize your tasks",
                      secondaryText:
                          "You can organize your daily tasks by adding your tasks into separate categories",
                      illustration: "onboarding3.svg",
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppButton(
                    text: "BACK",
                    onClick: () {
                      pageController.previousPage(
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.easeIn);
                    },
                    filled: false,
                  ),
                  AppButton(
                    text: currentIndex == 2 ? "GET STARTED" : "NEXT",
                    onClick: currentIndex == 2
                        ? () => pushGetStartedPage(context)
                        : () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInSine);
                          },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  pushGetStartedPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const StartScreen()));
  }
}

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return PageView();
  }
}
