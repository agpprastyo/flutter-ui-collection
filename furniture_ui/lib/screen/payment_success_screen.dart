import 'package:flutter/material.dart';
import 'package:furniture_ui/core/routes/routes.dart';
import 'package:furniture_ui/core/themes/color.dart';
import 'package:go_router/go_router.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Image.asset(
                    'assets/success-payment.png',
                    // height: 250,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Your order will be delivered soon.\nThank you for choosing our app!',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                  color: AppColors.title1),
            ),
            const SizedBox(height: 20),
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                FilledButton(onPressed: () {}, child: Text('Track your order')),
                SizedBox(height: 25),
                OutlinedButton(
                    onPressed: () {
                      context.pushReplacementNamed(RoutesName.home.name);
                    },
                    child: Text('BACK TO HOME')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
