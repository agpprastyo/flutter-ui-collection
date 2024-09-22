import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:furniture_ui/core/routes/routes.dart';
import 'package:furniture_ui/core/themes/text_styles.dart';
import 'package:furniture_ui/widgets/main_text_form_field.dart';
import 'package:go_router/go_router.dart';

import '../core/themes/color.dart';

class ShippingAddressAddScreen extends StatelessWidget {
  const ShippingAddressAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FocusNode fullNameFocusNode = FocusNode();
    TextEditingController fullNameController = TextEditingController();
    FocusNode addressFocusNode = FocusNode();
    TextEditingController addressController = TextEditingController();

    FocusNode countryFocusNode = FocusNode();
    TextEditingController countryController = TextEditingController();

    FocusNode cityFocusNode = FocusNode();
    TextEditingController cityController = TextEditingController();

    // district
    FocusNode districtFocusNode = FocusNode();
    TextEditingController districtController = TextEditingController();

    return Scaffold(
        appBar: const ShippingAddressAddAppBar(),
        bottomNavigationBar: const SaveAddressBottom(),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(20, 25, 20, 0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    textFormContainer(
                      child: Center(
                        child: MainTextFormField(
                          hintText: 'John Doe',
                          focusNode: fullNameFocusNode,
                          controller: fullNameController,
                          label: 'Full name',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    textFormContainer(
                      child: Center(
                        child: MainTextFormField(
                          hintText: '123 Main Street',
                          focusNode: addressFocusNode,
                          controller: addressController,
                          label: 'Address',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    textFormContainer(
                      child: Center(
                        child: MainTextFormField(
                          onTap: () {},
                          hintText: 'Select Country',
                          focusNode: countryFocusNode,
                          controller: countryController,
                          label: 'Country',
                          border: InputBorder.none,
                          suffixIcon: const Icon(IconlyLight.arrowDown2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    textFormContainer(
                      child: Center(
                        child: MainTextFormField(
                          onTap: () {},
                          hintText: 'Select City',
                          focusNode: cityFocusNode,
                          controller: cityController,
                          label: 'City',
                          border: InputBorder.none,
                          suffixIcon: const Icon(IconlyLight.arrowDown2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    textFormContainer(
                      child: Center(
                        child: MainTextFormField(
                          onTap: () {},
                          hintText: 'Select District',
                          focusNode: districtFocusNode,
                          controller: districtController,
                          label: 'Country',
                          border: InputBorder.none,
                          suffixIcon: const Icon(IconlyLight.arrowDown2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Container textFormContainer({required Widget child}) {
    return Container(
        height: 70,
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: AppColors.strokeDivider, width: 1),
        ),
        child: child);
  }
}

class SaveAddressBottom extends StatefulWidget {
  const SaveAddressBottom({
    super.key,
  });

  @override
  State<SaveAddressBottom> createState() => _SaveAddressBottomState();
}

class _SaveAddressBottomState extends State<SaveAddressBottom> {
  bool isKeyboardOpen = false;

// TODO fix padding when keyboard show up
  @override
  void initState() {
    super.initState();
    KeyboardVisibilityController().onChange.listen((event) {
      setState(() {
        isKeyboardOpen = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 20, isKeyboardOpen ? 20 : 90),
      child: SizedBox(
        height: 60,
        child: FilledButton(
          child: const Text('Save Address'),
          onPressed: () {
            context.canPop()
                ? context.pop()
                : context.go(RoutesName.shippingAddresses.name);
          },
        ),
      ),
    );
  }
}

class ShippingAddressAddAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ShippingAddressAddAppBar({
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
        'Add Shipping Address',
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
