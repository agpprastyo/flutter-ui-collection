import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_finder/views/screens/forgot_password_screen.dart';
import 'package:job_finder/views/screens/sign_up_screen.dart';

import '../../views/screens/login_screen.dart';
import '../../views/screens/onboarding_screen.dart';


enum RoutesName {
  onboarding('/onboarding'),
  login('login'),
  signUp('sign-up'),
  forgotPassword('forgot-password'),



  dashboard('/dashboard'),
  orders('/orders'),
  menu('/menu'),
  report('/report'),
  setting('/setting'),

  //

  ;

  final String name;

  const RoutesName(this.name);

  @override
  String toString() => name;
}


final GlobalKey<NavigatorState> _shellNavigatorKey =
GlobalKey<NavigatorState>();

class AppRouter {
  static GoRouter router = GoRouter(
      // observers: [GoRouterObserver()],
      debugLogDiagnostics: true,
      routerNeglect: true,
      initialLocation: RoutesName.onboarding.name,
      routes: [
  GoRoute(
  path: RoutesName.onboarding.name,
      name: RoutesName.onboarding.name,
      builder: (context, state) => const OnboardingScreen(),
      routes:  [
        GoRoute(
          path: RoutesName.login.name,
          name: RoutesName.login.name,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          path: RoutesName.signUp.name,
          name: RoutesName.signUp.name,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: RoutesName.forgotPassword.name,
          name: RoutesName.forgotPassword.name,
          builder: (context, state) => const ForgotPasswordScreen(),
        ),
      ])]);}