import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';

import '../core/routes/routes.dart';
import '../core/themes/color.dart';
import '../core/themes/text_styles.dart';

class ProfileItems {
  final String title;
  final String subtitle;
  final String route;

  ProfileItems({
    required this.title,
    required this.subtitle,
    this.route = '',
  });
}

final List<ProfileItems> profileItems = [
  ProfileItems(
      title: 'My orders',
      subtitle: 'Already have 10 orders',
      route: RoutesName.myOrder.name),
  ProfileItems(
      title: 'Shipping Addresses',
      subtitle: '03 Addresses',
      route: RoutesName.shippingAddresses.name),
  ProfileItems(
      title: 'Payment Method',
      subtitle: 'You have 2 cards',
      route: RoutesName.paymentMethod.name),
  ProfileItems(
      title: 'My reviews',
      subtitle: 'Reviews for 5 items',
      route: RoutesName.myReviews.name),
  ProfileItems(
      title: 'Setting',
      subtitle: 'Notification, Password, FAQ, Contact',
      route: RoutesName.setting.name),
];

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ProfileAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 30),
                child: Row(
                  children: [
                    const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40,
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
                    const SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bruno Pham',
                          style: AppTextStyles.nunito.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'bruno203@gmail.com',
                          style: AppTextStyles.nunito.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SliverList.builder(
              itemBuilder: (BuildContext context, int index) {
                final item = profileItems[index];
                return Padding(
                  padding: EdgeInsets.fromLTRB(
                      20, 10, 20, index == profileItems.length - 1 ? 80 : 10),
                  child: Card(
                    shape: const RoundedRectangleBorder(
                      side:
                          BorderSide(color: AppColors.placeholder, width: 0.1),
                      borderRadius: BorderRadius.all(Radius.circular(0)),
                    ),
                    child: ListTile(
                      trailing: const Icon(IconlyLight.arrowRight2),
                      title: Text(item.title),
                      subtitle: Text(item.subtitle),
                      onTap: () {
                        context.goNamed(item.route);
                      },
                    ),
                  ),
                );
              },
              itemCount: profileItems.length,
            ),
          ],
        ));
  }
}

class ProfileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ProfileAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 0),
        child: IconButton(
          icon: const Icon(IconlyLight.search),
          onPressed: () {},
        ),
      ),
      title: Text(
        'Profile',
        style: AppTextStyles.gelasio.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary),
      ),
      actions: [
        IconButton(
          icon: const Icon(IconlyLight.logout),
          onPressed: () {
            context.pushReplacementNamed(RoutesName.onboarding.name);
          },
        ),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
