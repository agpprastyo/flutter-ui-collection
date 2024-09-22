import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:furniture_ui/widgets/main_text_form_field.dart';
import 'package:go_router/go_router.dart';

import '../core/routes/routes.dart';
import '../core/themes/color.dart';
import '../core/themes/text_styles.dart';
import '../widgets/card_section.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const SettingAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
                padding: const EdgeInsets.all(20),
                sliver: SliverList.list(children: [
                  TitleSection(
                    title: 'Personal Information',
                    onPressed: () {},
                  ),
                  CardSectionSetting(
                    label: 'Full Name',
                    controller: TextEditingController(text: 'John Doe'),
                    focusNode: FocusNode(),
                  ),
                  const SizedBox(height: 15),
                  CardSectionSetting(
                    label: 'Full Name',
                    controller: TextEditingController(text: 'John Doe'),
                    focusNode: FocusNode(),
                  ),
                  const SizedBox(height: 25),
                  TitleSection(
                    title: 'Password',
                    onPressed: () {},
                  ),
                  CardSectionSetting(
                    label: 'Name',
                    controller: TextEditingController(text: '*******'),
                    focusNode: FocusNode(),
                  ),
                  const SizedBox(height: 25),
                  const TitleSection(
                    title: 'Notification',
                  ),
                  CardSectionSetting(
                    controller: TextEditingController(text: 'Sales'),
                    focusNode: FocusNode(),
                    suffixIcon: const SwitchSetting(),
                  ),
                  const SizedBox(height: 15),
                  CardSectionSetting(
                    controller: TextEditingController(text: 'New arrivals'),
                    focusNode: FocusNode(),
                    suffixIcon: const SwitchSetting(),
                  ),
                  const SizedBox(height: 25),
                  const TitleSection(
                    title: 'Help Center',
                  ),
                  CardSectionSetting(
                    controller: TextEditingController(text: 'FAQ'),
                    focusNode: FocusNode(),
                    suffixIcon: const Icon(IconlyLight.arrowRight2),
                  ),
                  const SizedBox(height: 15),
                  CardSectionSetting(
                    controller: TextEditingController(text: 'Contact Us'),
                    focusNode: FocusNode(),
                    suffixIcon: const Icon(IconlyLight.arrowRight2),
                  ),
                  const SizedBox(height: 15),
                  CardSectionSetting(
                    controller: TextEditingController(text: 'Privacy & Terms'),
                    focusNode: FocusNode(),
                    suffixIcon: const Icon(IconlyLight.arrowRight2),
                  ),
                  const SizedBox(height: 85),
                ])),
          ],
        ));
  }
}

class SwitchSetting extends StatefulWidget {
  const SwitchSetting({
    super.key,
  });

  @override
  State<SwitchSetting> createState() => _SwitchSettingState();
}

class _SwitchSettingState extends State<SwitchSetting> {
  bool isSwitched = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isSwitched,
      onChanged: (value) {
        setState(() {
          isSwitched = value;
        });
      },
      activeColor: AppColors.success,
    );
  }
}

class SettingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SettingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 16),
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
        'Setting',
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
