import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../core/routes/routes.dart';
import '../core/themes/color.dart';
import '../core/themes/text_styles.dart';
import 'cart_screen.dart';

class BookmarkScreen extends StatelessWidget {
  const BookmarkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int itemCount = 100;
    return Scaffold(
        appBar: const BookmarkAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(20),
              sliver: SliverList.builder(
                  itemCount: itemCount,
                  itemBuilder: (context, index) {
                    return ListTile(
                      isThreeLine: true,
                      tileColor: Colors.transparent,
                      dense: false,
                      visualDensity:
                          const VisualDensity(vertical: 4, horizontal: 4),
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
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
                          Flexible(
                            flex: 2,
                            child: IconButton(
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
                          ),
                          Flexible(
                            flex: 2,
                            child: IconButton(
                              onPressed: () {},
                              splashColor: Colors.transparent,
                              icon: const Icon(IconlyLight.bag),
                              iconSize: 20,
                              color: AppColors.primary,
                              style: IconButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}

class BookmarkAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BookmarkAppBar({
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
        'Favorites',
        style: AppTextStyles.gelasio.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary),
      ),
      actions: [
        IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: () {
              context.pushNamed(RoutesName.cart.name);
            },
            icon: const Badge(
              smallSize: 10,
              largeSize: 20,
              offset: Offset(10, -8),
              backgroundColor: Colors.red,
              label: Text('9+'),
              child: Icon(Icons.shopping_cart_outlined),
            )),
        const SizedBox(width: 20),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
