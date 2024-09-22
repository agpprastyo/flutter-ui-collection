import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_finder/core/routes/router.dart';
import 'package:job_finder/core/styles/color.dart';
import 'package:job_finder/core/utils/extensions.dart';

import '../widgets/checkbox_list_tile.dart';
import '../widgets/main_button.dart';
import '../widgets/main_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome Back', style: context.textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor',
                  textAlign: TextAlign.center,
                  style: context.textTheme.bodyMedium),
              const SizedBox(height: 64),
              Wrap(
                runSpacing: 10,
                children: [
                  Text('Email',
                      style: context.textTheme.titleSmall
                          ?.copyWith(color: AppColors.primary)),
                  MainTextFormField(
                    hintText: 'Brandonelouis@gmail.com ',
                    keyboardType: TextInputType.emailAddress,
                    focusNode: FocusNode(),
                    controller: TextEditingController(),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Wrap(
                runSpacing: 10,
                children: [
                  Text('Password',
                      style: context.textTheme.titleSmall
                          ?.copyWith(color: AppColors.primary)),
                  MainTextFormField(
                    hintText: '*********',
                    isPassword: true,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: FocusNode(),
                    controller: TextEditingController(),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(child: MainCheckBoxListTile()),
                  TextButton(
                      onPressed: () {
                        context.goNamed(RoutesName.forgotPassword.name);
                      },
                      child: Text('Forgot Password?',
                          style: context.textTheme.bodyMedium)),
                ],
              ),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Wrap(
                  runSpacing: 20,
                  children: [
                    MainElevatedButton(
                      onPressed: () {},
                      text: 'LOGIN',
                      type: ButtonType.primary,
                    ),
                    MainElevatedButton(
                      onPressed: () {},
                      type: ButtonType.secondary,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/google.png',
                              width: 24, height: 24),
                          const SizedBox(width: 10),
                          Text('Sign in with Google',
                              style: context.textTheme.bodyLarge),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account? ',
                      style: context.textTheme.bodyMedium),
                  TextButton(
                      onPressed: () {
                        context.goNamed(RoutesName.signUp.name);
                      },
                      child: Text('Sign Up',
                          style: context.textTheme.bodyMedium?.copyWith(
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.tertiary,
                              color: AppColors.tertiary))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
