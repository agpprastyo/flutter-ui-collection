
import 'package:flutter/material.dart';
import 'package:job_finder/core/utils/extensions.dart';

import '../../core/styles/color.dart';

enum ButtonType { primary, secondary, tertiary }

class MainElevatedButton extends StatelessWidget {
  const MainElevatedButton(
      {super.key,
        required this.onPressed,
        this.child,
        this.text,
        required this.type});

  final VoidCallback onPressed;
  final String? text;
  final Widget? child;
  final ButtonType type;

  @override
  Widget build(BuildContext context) {
    Color color;
    Color textColor;
    switch (type) {
      case ButtonType.primary:
        color = AppColors.primary;
        textColor = Colors.white;
        break;
      case ButtonType.secondary:
        color = AppColors.secondary;
        textColor = AppColors.primary;
        break;
      case ButtonType.tertiary:
        color = AppColors.tertiary;
        textColor = Colors.white;

        break;
    }

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
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
            elevation: 0,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: color,
            padding: const EdgeInsets.symmetric(vertical: 16),
            minimumSize: const Size(double.infinity, 50)),
        child: child ??
            Text(
              text ?? 'Login',
              style: context.textTheme.bodyLarge!.copyWith(color: textColor),
            ),
      ),
    );
  }
}
