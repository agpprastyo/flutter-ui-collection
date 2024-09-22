import 'package:flutter/material.dart';

// TODO add payment method screen
class PaymentMethodAddScreen extends StatelessWidget {
  const PaymentMethodAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Payment Method'),
      ),
      body: const Center(
        child: Text('Add Payment Method Screen'),
      ),
    );
  }
}
