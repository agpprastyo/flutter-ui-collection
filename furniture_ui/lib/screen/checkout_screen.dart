import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:furniture_ui/widgets/card_section.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../core/routes/routes.dart';
import '../core/themes/color.dart';
import '../core/themes/text_styles.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconlyLight.arrowLeft2),
          onPressed: () {
            context.canPop() ? context.pop() : context.go(RoutesName.home.name);
          },
        ),
        title: const Text(
          'Checkout',
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 35),
        child: FilledButton(
            onPressed: () {
              context.goNamed(RoutesName.paymentSuccess.name);
            },
            child: const Text('Submit Order')),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              sliver: SliverList(
                  delegate: SliverChildListDelegate([
                TitleSection(title: 'Shipping Address', onPressed: () {}),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Bruno Fernades',
                              style: AppTextStyles.nunito.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                        height: 0,
                        color: AppColors.secondaryButtonBG,
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: Text(
                          '25 rue Robert Latouche, Nice, 06200, Côte',
                          style: AppTextStyles.nunito.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.title2),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                        child: Text(
                          'D’azur, France',
                          style: AppTextStyles.nunito.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: AppColors.title2),
                        ),
                      ),
                    ],
                  ),
                ),
                TitleSection(title: 'Payment', onPressed: () {}),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.shadow.withOpacity(0.1),
                                blurRadius: 5,
                                spreadRadius: 2,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Image.asset(
                            'assets/mastercard_logo.png',
                            height: 25,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Text(
                          '**** **** **** 3947',
                          style: AppTextStyles.nunito.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                TitleSection(title: 'Delivery method', onPressed: () {}),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 15, 0, 15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/dhl.png',
                          height: 25,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 16),
                        Text(
                          'Fast (2-3days)',
                          style: AppTextStyles.nunito.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w500),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 38),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    child: Wrap(
                      runSpacing: 16,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [title('Order: '), price(95)],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [title('Delivery: '), price(5)],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            title('Total: '),
                            price(100, isTotal: true)
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ])))
        ],
      ),
    );
  }

  Text title(String title) {
    return Text(
      title,
      style: AppTextStyles.nunito
          .copyWith(color: AppColors.textSecondary, fontSize: 18),
    );
  }

  Text price(int title, {bool isTotal = false}) {
    return Text(
      NumberFormat.currency(
        locale: 'en_US',
        symbol: '\$',
        decimalDigits: 2,
      ).format(title),
      style: AppTextStyles.nunito.copyWith(
          color: AppColors.primary,
          fontSize: 18,
          fontWeight: isTotal ? FontWeight.bold : FontWeight.w500),
    );
  }
}
