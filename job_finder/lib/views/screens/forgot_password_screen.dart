import 'package:flutter/material.dart';
import 'package:job_finder/core/utils/extensions.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Forgot Password Screen', style: context.textTheme.headlineMedium),
            ],
          ),
        ),
      ),
    );
  }
}
