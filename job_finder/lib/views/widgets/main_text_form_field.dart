import 'package:flutter/material.dart';
import 'package:job_finder/core/utils/extensions.dart';

import '../../core/styles/color.dart';


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
    return Container(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            color: Colors.black12,
            blurRadius: 64,

          ),
        ],

      ),
      child: TextFormField(
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

          filled: true,
          fillColor: Colors.white,
          hintText: widget.hintText,
          hintStyle: context.textTheme.bodyMedium!.copyWith(
            color: AppColors.textSecondary,
          ),
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

          labelStyle: context.textTheme.labelSmall!,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          ),
      ),
    );
  }
}