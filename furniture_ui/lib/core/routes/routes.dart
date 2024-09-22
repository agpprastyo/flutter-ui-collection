import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ui/screen/auth/sign_in.dart';
import 'package:furniture_ui/screen/auth/sign_up.dart';
import 'package:furniture_ui/screen/bookmark_screen.dart';
import 'package:furniture_ui/screen/cart_screen.dart';
import 'package:furniture_ui/screen/checkout_screen.dart';
import 'package:furniture_ui/screen/coba_screen.dart';
import 'package:furniture_ui/screen/my_order_screen.dart';
import 'package:furniture_ui/screen/my_reviews__screen.dart';
import 'package:furniture_ui/screen/notification_screen.dart';
import 'package:furniture_ui/screen/onboarding_screen.dart';
import 'package:furniture_ui/screen/payment_method_screen.dart';
import 'package:furniture_ui/screen/payment_success_screen.dart';
import 'package:furniture_ui/screen/product_detail_screen.dart';
import 'package:furniture_ui/screen/profile_screen.dart';
import 'package:furniture_ui/screen/review_screen.dart';
import 'package:furniture_ui/screen/setting_screen.dart';
import 'package:furniture_ui/screen/shipping_address_add_screen.dart';
import 'package:furniture_ui/screen/shipping_address_screen.dart';
import 'package:go_router/go_router.dart';

import '../../bloc/page_cubit.dart';
import '../../screen/dashboard_screen.dart';
import '../../screen/home_screen.dart';

enum RoutesName {
  onboarding('/onboarding'),
  signIn('sign-in'),
  signUp('sign-up'),
  dashboard('dashboard'),
  home('/home'),
  bookmark('/bookmark'),
  notification('/notification'),
  profile('/profile'),
  myOrder('my-order'),
  shippingAddresses('shipping-addresses'),
  paymentMethod('payment-method'),
  myReviews('my-reviews'),
  setting('setting'),
  addShippingAddress('add-shipping-address'),
  coba('/coba'),
  cart('/cart'),
  checkout('checkout'),
  paymentSuccess('payment-success'),
  productDetail('/product-detail'),
  review('review'),
  ;

  final String name;

  const RoutesName(this.name);

  @override
  String toString() => name;
}

final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>();

class AppRouter {
  static GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routerNeglect: true,
    initialLocation: RoutesName.onboarding.name,
    routes: [
      GoRoute(
          path: RoutesName.onboarding.name,
          name: RoutesName.onboarding.name,
          builder: (context, state) => const OnboardingScreen(),
          routes: [
            GoRoute(
              path: RoutesName.signIn.name,
              name: RoutesName.signIn.name,
              builder: (context, state) => const SignInScreen(),
            ),
            GoRoute(
              path: RoutesName.signUp.name,
              name: RoutesName.signUp.name,
              builder: (context, state) => const SignUpScreen(),
            ),
          ]),

      // Nested route for Dashboard with Bottom Navigation
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => DashboardScreen(
          child: child,
        ),
        routes: [
          GoRoute(
            path: RoutesName.home.name,
            name: RoutesName.home.name,
            pageBuilder: (BuildContext context, GoRouterState state) {
              return slideTransition(state, child: const HomeScreen());
            },
          ),
          GoRoute(
              path: RoutesName.bookmark.name,
              name: RoutesName.bookmark.name,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return slideTransition(state, child: const BookmarkScreen());
              }),
          GoRoute(
              path: RoutesName.notification.name,
              name: RoutesName.notification.name,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return slideTransition(state,
                    child: const NotificationScreen());
              }),
          GoRoute(
              path: RoutesName.profile.name,
              name: RoutesName.profile.name,
              pageBuilder: (BuildContext context, GoRouterState state) {
                return slideTransition(state, child: const ProfileScreen());
              },
              routes: [
                GoRoute(
                  path: RoutesName.myOrder.name,
                  name: RoutesName.myOrder.name,
                  builder: (context, state) => const MyOrderScreen(),
                ),
                GoRoute(
                    path: RoutesName.shippingAddresses.name,
                    name: RoutesName.shippingAddresses.name,
                    builder: (context, state) => const ShippingAddressScreen(),
                    routes: [
                      GoRoute(
                        path: RoutesName.addShippingAddress.name,
                        name: RoutesName.addShippingAddress.name,
                        builder: (context, state) =>
                            const ShippingAddressAddScreen(),
                      ),
                    ]),
                GoRoute(
                  path: RoutesName.paymentMethod.name,
                  name: RoutesName.paymentMethod.name,
                  builder: (context, state) => const PaymentMethodScreen(),
                ),
                GoRoute(
                  path: RoutesName.myReviews.name,
                  name: RoutesName.myReviews.name,
                  builder: (context, state) => const MyReviewsScreen(),
                ),
                GoRoute(
                  path: RoutesName.setting.name,
                  name: RoutesName.setting.name,
                  builder: (context, state) => const SettingScreen(),
                ),
              ]),
        ],
      ),
      GoRoute(
          path: RoutesName.productDetail.name,
          name: RoutesName.productDetail.name,
          builder: (context, state) => const ProductDetailScreen(),
          routes: [
            GoRoute(
              path: RoutesName.review.name,
              name: RoutesName.review.name,
              builder: (context, state) => const ReviewScreen(),
            ),
          ]),

      GoRoute(
        path: RoutesName.coba.name,
        name: RoutesName.coba.name,
        builder: (context, state) => const CobaScreen(),
      ),
      GoRoute(
          path: RoutesName.cart.name,
          name: RoutesName.cart.name,
          builder: (context, state) => const CartScreen(),
          routes: [
            GoRoute(
                path: RoutesName.checkout.name,
                name: RoutesName.checkout.name,
                builder: (context, state) => const CheckoutScreen(),
                routes: [
                  GoRoute(
                    path: RoutesName.paymentSuccess.name,
                    name: RoutesName.paymentSuccess.name,
                    builder: (context, state) => const PaymentSuccessScreen(),
                  ),
                ]),
          ]),
    ],
  );
}

CustomTransitionPage<void> slideTransition(GoRouterState state,
    {required Widget child}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    barrierDismissible: true,
    barrierColor: Colors.white,
    opaque: false,
    transitionDuration: const Duration(milliseconds: 500),
    reverseTransitionDuration: const Duration(milliseconds: 500),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      final PageCubit pageCubit = BlocProvider.of<PageCubit>(context);
      final previousIndex = pageCubit.previousIndex;
      final currentIndex = pageCubit.state;

      // Check if the current index is greater than the previous index
      final isForward = previousIndex < currentIndex;

      // Define the begin and end offsets based on the direction
      final begin =
          isForward ? const Offset(1.0, 0.0) : const Offset(-1.0, 0.0);
      const end = Offset(0.0, 0.0);

      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);

      return SlideTransition(
        position: offsetAnimation,
        child: child,
      );
    },
  );
}
