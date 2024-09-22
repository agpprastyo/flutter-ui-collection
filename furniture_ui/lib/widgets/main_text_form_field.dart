import 'package:flutter/material.dart';
import 'package:furniture_ui/core/themes/color.dart';
import 'package:furniture_ui/core/themes/text_styles.dart';

class MainTextFormField extends StatefulWidget {
  const MainTextFormField({
    super.key,
    required this.focusNode,
    required this.controller,
    this.label,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.border = const UnderlineInputBorder(
      borderSide: BorderSide(
        color: AppColors.textSecondary,
      ),
    ),
    this.hintText,
    this.onTap,
    this.suffixIcon,
  });

  final FocusNode focusNode;
  final TextEditingController controller;
  final String? label;
  final bool isPassword;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final InputBorder border;
  final String? hintText;
  final Function()? onTap;
  final Widget? suffixIcon;

  @override
  State<MainTextFormField> createState() => _MainTextFormFieldState();
}

class _MainTextFormFieldState extends State<MainTextFormField> {
  bool isObscure = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.keyboardType,
      focusNode: widget.focusNode,
      controller: widget.controller,
      textInputAction: widget.textInputAction,
      onChanged: (value) {
        widget.controller.text = value;
      },
      onTapOutside: (PointerDownEvent event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      onTap: widget.onTap,
      readOnly: widget.onTap == null ? false : true,
      obscureText: isObscure,
      decoration: InputDecoration(
        hintText: widget.hintText,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.textSecondary,
                ),
              )
            : widget.suffixIcon,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelText: widget.label,
        labelStyle: AppTextStyles.nunito
            .copyWith(fontSize: 16, color: AppColors.textSecondary),
        border: widget.border,
      ),
    );
  }
}
