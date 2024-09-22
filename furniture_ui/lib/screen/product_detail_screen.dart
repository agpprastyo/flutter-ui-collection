import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:furniture_ui/core/routes/routes.dart';
import 'package:furniture_ui/core/themes/color.dart';
import 'package:furniture_ui/core/themes/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'cart_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return Scaffold(
        extendBody: true,
        bottomNavigationBar: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          margin: const EdgeInsets.only(bottom: 30),
          child: Row(
            children: [
              IconButton.filled(
                style: IconButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                  backgroundColor: AppColors.secondaryButtonBG,
                ),
                onPressed: () {},
                icon: const Icon(
                  IconlyLight.bookmark,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: FilledButton(
                      onPressed: () {}, child: const Text('Add to cart'))),
            ],
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.85,
                    height: MediaQuery.sizeOf(context).height * 0.5,
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                      ),
                      image: DecorationImage(
                        image: AssetImage('assets/onboarding.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: MediaQuery.sizeOf(context).width * 0.05,
                  child: Column(
                    children: [
                      IconButton.filled(
                        style: IconButton.styleFrom(
                          fixedSize: const Size(40, 40),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: AppColors.primary.withOpacity(0.5),
                                width: 0.1),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 5,
                          shadowColor: AppColors.shadow,
                          backgroundColor: Colors.white,
                        ),
                        icon: const Icon(
                          IconlyLight.arrowLeft2,
                          color: AppColors.primary,
                        ),
                        onPressed: () {
                          context.canPop()
                              ? context.pop()
                              : context.goNamed(RoutesName.home.name);
                        },
                      ),
                      const SizedBox(height: 28),
                      Container(
                        width: 74,
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(99),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const ProductColorSelection(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.3,
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: ListView(
                padding: const EdgeInsets.only(top: 20),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Minimal Stand',
                            style: AppTextStyles.gelasio.copyWith(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            NumberFormat.currency(
                              locale: 'en_US',
                              symbol: '\$',
                              decimalDigits: 0,
                            ).format(50),
                            style: AppTextStyles.nunito.copyWith(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Wrap(
                        children: [
                          const IconAdjust(
                            icon: Icons.remove,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: Text(
                              '1',
                              style: AppTextStyles.nunito.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.title2),
                            ),
                          ),
                          const IconAdjust(
                            icon: Icons.add,
                          ),
                        ],
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      context.goNamed(RoutesName.review.name);
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 25,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '4.5',
                          style: AppTextStyles.nunito.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          '(50 reviews)',
                          style: AppTextStyles.nunito.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    textAlign: TextAlign.justify,
                    'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ',
                    style: AppTextStyles.nunito
                        .copyWith(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

List<Color> productColors = [
  Colors.white,
  const Color(0xFFB4916C),
  const Color(0xFFE4CBAD),
];

class ProductColorSelection extends StatefulWidget {
  const ProductColorSelection({
    super.key,
  });

  @override
  State<ProductColorSelection> createState() => _ProductColorSelectionState();
}

class _ProductColorSelectionState extends State<ProductColorSelection> {
  Color? _selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: productColors.map((color) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedColor = color;
            });
          },
          child: circleColor(
            color: color,
            isSelected: _selectedColor == color,
          ),
        );
      }).toList(),
    );
  }

  CircleAvatar circleColor({required Color color, required bool isSelected}) {
    return CircleAvatar(
      radius: 34,
      backgroundColor:
          isSelected ? AppColors.title1 : AppColors.secondaryButtonBG,
      child: CircleAvatar(
        radius: 16,
        backgroundColor: color,
      ),
    );
  }
}
