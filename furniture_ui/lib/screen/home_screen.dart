import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:furniture_ui/core/routes/routes.dart';
import 'package:furniture_ui/core/themes/text_styles.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../core/themes/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 5, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
          extendBody: true,
          appBar: MyOrderAppBar(
            controller: controller,
          ),
          body: TabBarView(controller: controller, children: [
            CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.all(20),
                  sliver: SliverGrid.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.5,
                      ),
                      itemCount: 100,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            context.pushNamed(RoutesName.productDetail.name);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 245,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://images.unsplash.com/photo-1581539250439-c96689b516dd?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                'The chair on the white',
                                style: AppTextStyles.nunito.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: AppColors.title1),
                              ),
                              Text(
                                NumberFormat.currency(
                                  locale: 'en_US',
                                  symbol: '\$',
                                  decimalDigits: 0,
                                ).format(90),
                                style: AppTextStyles.nunito.copyWith(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.primary),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ],
            ),
            const Center(child: Text('Chair')),
            const Center(child: Text('Table')),
            const Center(child: Text('Chair')),
            const Center(child: Text('Table')),
          ])),
    );
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}

class MyOrderAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MyOrderAppBar({
    super.key,
    required this.controller,
  });

  final TabController controller;

  @override
  State<MyOrderAppBar> createState() => _MyOrderAppBarState();

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}

class _MyOrderAppBarState extends State<MyOrderAppBar> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {
      setState(() {
        currentIndex = widget.controller.index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(IconlyLight.search),
        onPressed: () {},
      ),
      title: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            'Make Home',
            style: AppTextStyles.gelasio.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: AppColors.title1),
          ),
          Text(
            'BEAUTIFUL',
            style: AppTextStyles.gelasio.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary),
          ),
        ],
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
      bottom: TabBar(
        controller: widget.controller,
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 1,
        indicatorColor: AppColors.primary,
        isScrollable: false,
        unselectedLabelColor: AppColors.placeholder,
        splashFactory: NoSplash.splashFactory,
        tabs: [
          const Tab(
            // icon: Container(
            //     padding: const EdgeInsets.all(10),
            //     decoration: BoxDecoration(
            //       color: currentIndex == 0
            //           ? AppColors.primary.withOpacity(0.1)
            //           : Colors.transparent,
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: Icon(
            //       IconlyBold.home,
            //       color:
            //           widget.controller.index == 0 ? Colors.red : Colors.blue,
            //     )),
            text: 'All',
          ),
          const Tab(
            text: 'Chair',
          ),
          const Tab(
            text: 'Table',
          ),
          const Tab(
            text: 'Chair',
          ),
          const Tab(
            text: 'Table',
          ),
        ],
      ),
    );
  }
}
