import 'package:flutter/material.dart';
import 'package:furniture_ui/widgets/main_text_form_field.dart';
import 'package:go_router/go_router.dart';

import '../../core/routes/routes.dart';
import '../../core/themes/color.dart';
import '../../core/themes/text_styles.dart';
import '../../widgets/logo_header.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode nameFocusNode = FocusNode();
    TextEditingController nameController = TextEditingController();

    FocusNode emailFocusNode = FocusNode();
    TextEditingController emailController = TextEditingController();

    FocusNode passwordFocusNode = FocusNode();
    TextEditingController passwordController = TextEditingController();

    FocusNode confirmPasswordFocusNode = FocusNode();
    TextEditingController confirmPasswordController = TextEditingController();
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
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Text(
                          'WELCOME ',
                          style: AppTextStyles.gelasio.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: AppColors.title2),
                        ),
                      ),
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
                                label: 'Name',
                                focusNode: nameFocusNode,
                                controller: nameController,
                              ),
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
                                textInputAction: TextInputAction.next,
                              ),
                              MainTextFormField(
                                  isPassword: true,
                                  label: 'Confirm Password',
                                  focusNode: confirmPasswordFocusNode,
                                  controller: confirmPasswordController,
                                  keyboardType: TextInputType.visiblePassword,
                                  textInputAction: TextInputAction.done),
                              Container(
                                padding: const EdgeInsets.only(right: 30),
                                width: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      width: double.infinity,
                                      child: FilledButton(
                                          onPressed: () {
                                            context.pushReplacementNamed(
                                                RoutesName.home.name);
                                          },
                                          child: Text(
                                            'Sign Up',
                                            style:
                                                AppTextStyles.nunito.copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          )),
                                    ),
                                    const SizedBox(height: 20),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          'Already have an account?',
                                          style: TextStyle(
                                              color: AppColors.textSecondary,
                                              fontSize: 14),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              context.pushNamed(
                                                  RoutesName.signIn.name);
                                            },
                                            child: Text(
                                              'SIGN IN',
                                              style: AppTextStyles.nunito
                                                  .copyWith(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: AppColors.title2),
                                            )),
                                      ],
                                    ),
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
              )
            ],
          ),
        ));
  }
}
