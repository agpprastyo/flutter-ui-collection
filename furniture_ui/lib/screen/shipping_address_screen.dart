import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:furniture_ui/core/themes/color.dart';
import 'package:furniture_ui/core/themes/text_styles.dart';
import 'package:go_router/go_router.dart';

import '../core/routes/routes.dart';
import '../models/shipping_address.dart';

class ShippingAddressScreen extends StatelessWidget {
  const ShippingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ShippingAddressAppBar(),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: FloatingActionButton(
            elevation: 1,
            shape: const CircleBorder(),
            onPressed: () {
              context.goNamed(RoutesName.addShippingAddress.name);
            },
            backgroundColor: Colors.white,
            child: const Icon(Icons.add),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList.builder(
                itemCount: shippingAddresses.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = shippingAddresses[index];
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                        child: Row(
                          children: [
                            CheckboxShipping(item: item),
                            const SizedBox(width: 2),
                            Text(
                              'Use as the shipping address',
                              style: AppTextStyles.nunito.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.primary),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(20, 10, 20,
                            index == shippingAddresses.length - 1 ? 90 : 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.shadow.withOpacity(0.2),
                              blurRadius: 15,
                              spreadRadius: 0,
                              offset: const Offset(0, 7),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    item.fullName,
                                    style: AppTextStyles.nunito.copyWith(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primary),
                                  ),
                                  IconButton(
                                    icon: const Icon(IconlyLight.edit),
                                    onPressed: () {
                                      // context.go(RoutesName.editShippingAddress.name);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const Divider(
                              height: 0,
                              color: AppColors.secondaryButtonBG,
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                              child: Row(
                                children: [
                                  Text(
                                    item.address,
                                    style: AppTextStyles.nunito.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.title2),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    item.city,
                                    style: AppTextStyles.nunito.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: AppColors.title2),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                              child: Text(
                                item.district,
                                style: AppTextStyles.nunito.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.title2),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                })
          ],
        ));
  }
}

class CheckboxShipping extends StatefulWidget {
  const CheckboxShipping({
    super.key,
    required this.item,
  });

  final ShippingAddress item;

  @override
  State<CheckboxShipping> createState() => _CheckboxShippingState();
}

class _CheckboxShippingState extends State<CheckboxShipping> {
  @override
  Widget build(BuildContext context) {
    return Checkbox(
      visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
      value: widget.item.isSelected,
      onChanged: (value) {
        setState(() {
          if (value != null) {
            for (var element in shippingAddresses) {
              element.isSelected = false;
            }
            widget.item.isSelected = value;
          }
        });
      },
    );
  }
}

class ShippingAddressAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ShippingAddressAppBar({
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
        'Shipping Address',
        style: AppTextStyles.gelasio.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
