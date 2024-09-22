import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:furniture_ui/bloc/scroll_cubit.dart';

import '../bloc/page_cubit.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white.withAlpha(250),
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => ScrollCubit(),
        ),
      ],
      child: _DashboardScreenContent(
        child: child,
      ),
    );
  }
}

class _DashboardScreenContent extends StatelessWidget {
  const _DashboardScreenContent({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, currentPageIndex) {
        return Scaffold(
            extendBody: true,
            body: SafeArea(top: false, bottom: false, child: child),
            bottomNavigationBar: const BottomNavBar());
      },
    );
  }
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ScrollCubit, ScrollState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, scrollState) {
        ScrollCubit cubit = BlocProvider.of<ScrollCubit>(context);
        ScrollController controller = cubit.scrollCubitController;
        return AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return AnimatedContainer(
              color: Colors.transparent,
              duration: const Duration(milliseconds: 400),
              height: controller.hasClients &&
                      controller.position.userScrollDirection ==
                          ScrollDirection.reverse
                  ? 0
                  : 80,
              child: child,
            );
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF8A959E).withOpacity(0.1),
                  blurRadius: 7,
                  spreadRadius: 0,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: BlocBuilder<PageCubit, int>(
              builder: (context, currentPageIndex) {
                return NavigationBar(
                  overlayColor: WidgetStateColor.transparent,
                  surfaceTintColor: Colors.transparent,
                  backgroundColor: Colors.transparent,
                  elevation: 5,
                  indicatorColor: Colors.transparent,
                  onDestinationSelected: (index) {
                    context.read<PageCubit>().changePage(context, index);
                  },
                  selectedIndex: currentPageIndex,
                  labelBehavior:
                      NavigationDestinationLabelBehavior.onlyShowSelected,
                  destinations: const [
                    NavigationDestination(
                      icon: Icon(IconlyLight.home),
                      selectedIcon: Icon(IconlyBold.home),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      icon: Icon(IconlyLight.bookmark),
                      selectedIcon: Icon(IconlyBold.bookmark),
                      label: 'Bookmark',
                    ),
                    NavigationDestination(
                      icon: Icon(IconlyLight.notification),
                      selectedIcon: Icon(IconlyBold.notification),
                      label: 'Notification',
                    ),
                    NavigationDestination(
                      icon: Icon(IconlyLight.profile),
                      selectedIcon: Icon(IconlyBold.profile),
                      label: 'Profile',
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
