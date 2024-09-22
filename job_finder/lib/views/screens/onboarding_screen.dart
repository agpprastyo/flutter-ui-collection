import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:job_finder/core/routes/router.dart';
import 'package:job_finder/core/styles/color.dart';
import 'package:job_finder/core/utils/extensions.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                children: [
                  const Spacer(),
                  Text(
                    'Jobspot',
                    style: context.textTheme.headlineSmall,
                  ),
                ],
              ),
              const Spacer(),
              Center(child: SvgPicture.asset('assets/onboarding.svg')),
              const Spacer(),
              RichText(
                text: TextSpan(
                  style: context.textTheme.displayLarge
                      ?.copyWith(color: AppColors.primary),
                  children: const [
                    TextSpan(text: 'Find Your\n'),
                    TextSpan(
                      text: 'Dream Job',
                      style: TextStyle(color: AppColors.tertiary),
                    ),
                    TextSpan(text: ' \nHere!'),
                  ],
                ),
              ),
              Text(
                'Explore all the most exciting job roles based on your interest and study major.',
                style: context.textTheme.titleMedium,
              ),

              Row(
                children: [
                  const Spacer(),
                  IconButton.filled(
                    iconSize: 60,
                      color: Colors.white,
                      style:
                          IconButton.styleFrom(backgroundColor: AppColors.primary),
                      onPressed: () {
                      context.goNamed(RoutesName.login.name);
                      },
                      icon: const Icon(Icons.arrow_right_alt)),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
