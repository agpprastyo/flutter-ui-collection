import 'package:flutter/material.dart';
import 'package:furniture_ui/core/themes/color.dart';
import 'package:furniture_ui/core/themes/text_styles.dart';

import 'core/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: Colors.transparent,
        ),
        appBarTheme: AppBarTheme(
          titleTextStyle: AppTextStyles.gelasio.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primary),
          scrolledUnderElevation: 0,
          titleSpacing: 0,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColors.primary, size: 24),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            textStyle: AppTextStyles.nunito.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            elevation: 10,
            fixedSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            textStyle: AppTextStyles.nunito.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            elevation: 10,
            fixedSize: const Size(double.infinity, 55),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 40,
          shadowColor: AppColors.shadow,
          color: Colors.white,
          margin: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: AppColors.placeholder, width: 0.1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        listTileTheme: ListTileThemeData(
          contentPadding: const EdgeInsets.fromLTRB(20, 0, 10, 0),
          titleTextStyle: AppTextStyles.nunito.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.primary,
          ),
          subtitleTextStyle: AppTextStyles.nunito.copyWith(
            height: 2,
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: AppColors.textSecondary,
          ),
          tileColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 20),
          ),
        ),
        scaffoldBackgroundColor: Colors.white.withAlpha(250),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurpleAccent, primary: AppColors.primary),
        useMaterial3: true,
      ),
      routeInformationParser: AppRouter.router.routeInformationParser,
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routerDelegate: AppRouter.router.routerDelegate,
    );
  }
}
