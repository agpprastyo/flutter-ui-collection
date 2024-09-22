import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_ui/core/themes/color.dart';
import 'package:furniture_ui/core/themes/text_styles.dart';
import 'package:go_router/go_router.dart';

import '../core/routes/routes.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Image.asset(
            'assets/onboarding.png',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 50,
            child: SizedBox(
              height: MediaQuery.sizeOf(context).height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleOnboard(),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(60, 0, 30, 0),
                    child: Text(
                      textAlign: TextAlign.right,
                      'The best simple place where you discover most wonderful furniture\'s and make your home beautiful',
                      style: AppTextStyles.nunito.copyWith(
                          fontSize: 18, color: AppColors.textSecondary),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: FilledButton(
                        onPressed: () {
                          context.pushReplacementNamed(RoutesName.signIn.name);
                        },
                        child: const Text('Get Started')),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding titleOnboard() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Wrap(
        direction: Axis.vertical,
        spacing: 15,
        children: [
          Text(
            'MAKE YOUR',
            style: AppTextStyles.gelasio.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: AppColors.title1),
          ),
          Text(
            'HOME BEAUTIFUL',
            style: AppTextStyles.gelasio.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: AppColors.title2),
          ),
        ],
      ),
    );
  }
}
