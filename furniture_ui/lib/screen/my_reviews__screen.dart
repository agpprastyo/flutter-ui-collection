import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:go_router/go_router.dart';

import '../core/routes/routes.dart';
import '../core/themes/color.dart';
import '../core/themes/text_styles.dart';

class MyReviewsScreen extends StatelessWidget {
  const MyReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyReviewsAppBar(),
        body: CustomScrollView(
          slivers: [
            SliverList.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    shape: const RoundedRectangleBorder(
                      side:
                          BorderSide(color: AppColors.placeholder, width: 0.1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    margin:
                        EdgeInsets.fromLTRB(20, 10, 20, index == 9 ? 90 : 10),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(6),
                                child: Image.network(
                                  'https://images.unsplash.com/photo-1517705008128-361805f42e86?q=80&w=1987&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
                                  height: 70,
                                  width: 70,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Coffee Table',
                                    style: AppTextStyles.nunito.copyWith(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.title1),
                                  ),
                                  Text(
                                    'Category',
                                    style: AppTextStyles.nunito.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.primary),
                                  ),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 15),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RatingBar.builder(
                                  ignoreGestures: true,
                                  initialRating: 5,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,
                                  itemCount: 5,
                                  itemSize: 20,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  onRatingUpdate: (rating) {
                                    print(rating);
                                  },
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                ),
                                Text(
                                  '20/03/2020',
                                  style: AppTextStyles.nunito.copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: AppColors.textSecondary),
                                ),
                              ]),
                          const SizedBox(height: 15),
                          const Text(
                              textAlign: TextAlign.justify,
                              'Nice Furniture with good delivery. The delivery time is very fast. Then products look like exactly the picture in the app. Besides, color is also the same and quality is very good despite very cheap price')
                        ],
                      ),
                    ),
                  );
                })
          ],
        ));
  }
}

class MyReviewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyReviewsAppBar({
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
        'My Reviews',
        style: AppTextStyles.gelasio.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary),
      ),
      actions: [
        IconButton(
          icon: const Icon(IconlyLight.search),
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
