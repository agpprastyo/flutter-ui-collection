import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../core/themes/color.dart';
import '../core/themes/text_styles.dart';
import 'main_text_form_field.dart';

class CardSectionSetting extends StatelessWidget {
  const CardSectionSetting({
    super.key,
    this.label,
    required this.controller,
    required this.focusNode,
    this.suffixIcon,
  });

  final String? label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
        side: BorderSide(color: AppColors.placeholder, width: 0.1),
        borderRadius: BorderRadius.zero,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: MainTextFormField(
          onTap: () {},
          label: label,
          controller: controller,
          focusNode: focusNode,
          border: InputBorder.none,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.title,
    this.onPressed,
  });

  final String title;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.nunito.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.title1),
        ),
        onPressed == null
            ? const SizedBox(height: 32)
            : IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  IconlyLight.edit,
                  size: 18,
                )),
      ],
    );
  }
}
