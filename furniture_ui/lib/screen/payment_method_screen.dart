import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';

import '../core/routes/routes.dart';
import '../core/themes/color.dart';
import '../core/themes/text_styles.dart';
import '../models/payment_method.dart';

class PaymentMethodScreen extends StatelessWidget {
  const PaymentMethodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PaymentMethodAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverList.builder(
                itemCount: paymentMethods.length,
                itemBuilder: (context, index) {
                  final item = paymentMethods[index];
                  return Column(
                    children: [
                      ListTile(
                        leading: const Icon(IconlyLight.chart),
                        title: Text(
                          'Credit Card',
                          style: AppTextStyles.nunito.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary),
                        ),
                        subtitle: Text(
                          item.cardNumber,
                          style: AppTextStyles.nunito.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: AppColors.textSecondary),
                        ),
                        trailing: const Icon(IconlyLight.arrowRight2),
                        onTap: () {
                          // context.goNamed(RoutesName.creditCard.name);
                        },
                      ),
                      const Divider(
                        height: 0,
                        thickness: 1,
                      ),
                    ],
                  );
                }),
          ],
        ));
  }
}

class PaymentMethodAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const PaymentMethodAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: IconButton(
          icon: const Icon(IconlyLight.arrowLeft2),
          onPressed: () {
            context.canPop()
                ? context.pop()
                : context.go(RoutesName.profile.name);
          },
        ),
      ),
      title: Text(
        'Payment Method',
        style: AppTextStyles.gelasio.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
