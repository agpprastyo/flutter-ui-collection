import 'package:flutter/material.dart';

import '../core/themes/color.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          const Flexible(
            child: Divider(
              thickness: 1,
              color: AppColors.strokeDivider,
            ),
          ),
          Container(
            height: 65,
            width: 65,
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                'assets/logo.png',
              ),
            ),
          ),
          const Flexible(
            child: Divider(
              thickness: 1,
              color: AppColors.strokeDivider,
            ),
          ),
        ],
      ),
    );
  }
}
