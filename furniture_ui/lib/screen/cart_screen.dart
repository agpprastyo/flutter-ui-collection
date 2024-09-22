import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:furniture_ui/core/themes/color.dart';
import 'package:furniture_ui/core/themes/text_styles.dart';
import 'package:furniture_ui/widgets/main_text_form_field.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../core/routes/routes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withAlpha(250),
      appBar: const CartAppBar(),
      bottomSheet: const BottomCart(),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(20),
            sliver: SliverList.separated(
              itemCount: 1000,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  isThreeLine: true,
                  tileColor: Colors.transparent,
                  dense: false,
                  visualDensity: const VisualDensity(vertical: 4),
                  contentPadding: const EdgeInsets.all(0),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Image.network(
                      'https://images.unsplash.com/photo-1517705008128-361805f42e86?q=80&w=1987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  title: Text(
                    'Minimal Stand',
                    style: AppTextStyles.nunito.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.disabledButton),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        NumberFormat.currency(
                          locale: 'en_US',
                          symbol: '\$',
                          decimalDigits: 0,
                        ).format(300),
                        style: AppTextStyles.nunito.copyWith(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primary),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const IconAdjust(
                            icon: Icons.remove,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              '1',
                              style: AppTextStyles.nunito.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.title2),
                            ),
                          ),
                          const IconAdjust(
                            icon: Icons.add,
                          ),
                        ],
                      )
                    ],
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.cancel),
                        iconSize: 20,
                        color: AppColors.primary,
                        style: IconButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(
                  height: 0,
                  color: AppColors.secondaryButtonBG,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class IconAdjust extends StatelessWidget {
  const IconAdjust({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      width: 28,
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon),
        iconSize: 12,
        color: AppColors.primary,
        style: IconButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            backgroundColor: AppColors.secondaryButtonBG),
      ),
    );
  }
}

class BottomCart extends StatelessWidget {
  const BottomCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              Flexible(
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                    ),
                    child: MainTextFormField(
                        hintText: 'Enter promo code',
                        border: InputBorder.none,
                        focusNode: FocusNode(),
                        controller: TextEditingController()),
                  ),
                ),
              ),
              IconButton.filled(
                  style: IconButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  icon: const Icon(IconlyLight.arrowRight2))
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total',
                style: AppTextStyles.nunito.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: AppColors.textSecondary),
              ),
              Text(
                NumberFormat.currency(
                  locale: 'en_US',
                  symbol: '\$',
                  decimalDigits: 0,
                ).format(900),
                style: AppTextStyles.nunito.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: AppColors.title2),
              )
            ],
          ),
          const SizedBox(height: 15),
          FilledButton(
              onPressed: () {
                context.goNamed(RoutesName.checkout.name);
              },
              child: const Text('Check out')),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}

class CartAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CartAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(IconlyLight.arrowLeft2),
        onPressed: () {
          context.canPop() ? context.pop() : context.go(RoutesName.home.name);
        },
      ),
      title: const Text(
        'Cart',
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
