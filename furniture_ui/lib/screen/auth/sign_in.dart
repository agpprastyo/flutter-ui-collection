import 'package:flutter/material.dart';
import 'package:furniture_ui/core/themes/color.dart';
import 'package:furniture_ui/widgets/main_text_form_field.dart';
import 'package:go_router/go_router.dart';

import '../../core/routes/routes.dart';
import '../../core/themes/text_styles.dart';
import '../../widgets/logo_header.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode emailFocusNode = FocusNode();
    TextEditingController emailController = TextEditingController();

    FocusNode passwordFocusNode = FocusNode();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const LogoHeader(),
                    const SizedBox(height: 0),
                    titleSignIn(),
                    Container(
                      padding: const EdgeInsets.fromLTRB(30, 35, 0, 35),
                      margin: const EdgeInsets.fromLTRB(0, 30, 30, 0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF8A959E).withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 0,
                            offset: const Offset(0, 7),
                          ),
                        ],
                      ),
                      child: Form(
                        child: Wrap(
                          runSpacing: 35,
                          children: [
                            MainTextFormField(
                                label: 'Email',
                                focusNode: emailFocusNode,
                                controller: emailController,
                                keyboardType: TextInputType.emailAddress),
                            MainTextFormField(
                                isPassword: true,
                                label: 'Password',
                                focusNode: passwordFocusNode,
                                controller: passwordController,
                                keyboardType: TextInputType.visiblePassword,
                                textInputAction: TextInputAction.done),
                            Container(
                              padding: const EdgeInsets.only(right: 30),
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Forgot Password?',
                                        style: AppTextStyles.nunito.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.title2),
                                      )),
                                  const SizedBox(height: 40),
                                  SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: FilledButton(
                                        onPressed: () {},
                                        child: Text(
                                          'Sign In',
                                          style: AppTextStyles.nunito.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        )),
                                  ),
                                  const SizedBox(height: 20),
                                  TextButton(
                                      onPressed: () {
                                        context
                                            .pushNamed(RoutesName.signUp.name);
                                      },
                                      child: Text(
                                        'SIGN UP',
                                        style: AppTextStyles.nunito.copyWith(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w600,
                                            color: AppColors.title2),
                                      )),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container titleSignIn() {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: Wrap(
        direction: Axis.vertical,
        spacing: 15,
        children: [
          Text(
            'Hello !',
            style: AppTextStyles.gelasio.copyWith(
                fontSize: 30,
                fontWeight: FontWeight.w600,
                color: AppColors.title1),
          ),
          Text(
            'WELCOME BACK',
            style: AppTextStyles.gelasio.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.title2),
          ),
        ],
      ),
    );
  }
}
