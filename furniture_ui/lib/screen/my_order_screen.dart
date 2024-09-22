import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/scheduler/ticker.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:go_router/go_router.dart';

import '../core/routes/routes.dart';
import '../core/themes/color.dart';
import '../core/themes/text_styles.dart';

class OrderItems {
  final int idOrder;
  final String date;
  final int quantity;
  final double totalAmount;
  final int status;

  OrderItems({
    required this.idOrder,
    required this.date,
    required this.quantity,
    required this.totalAmount,
    required this.status,
  });

  factory OrderItems.fromJson(Map<String, dynamic> json) {
    return OrderItems(
      idOrder: json['id_order'],
      date: json['date'],
      quantity: json['quantity'],
      totalAmount: json['total_amount'],
      status: json['status'],
    );
  }
}

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  late List<OrderItems> orderItems;
  late Future<List<OrderItems>> futureOrderItems;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    futureOrderItems = loadOrderItems();
  }

  Future<List<OrderItems>> loadOrderItems() async {
    final String response =
        await rootBundle.loadString('assets/dummy_order.json');
    final List<dynamic> jsonData = jsonDecode(response);
    return jsonData.map((json) => OrderItems.fromJson(json)).toList();
  }

  List<OrderItems> filterOrdersByStatus(List<OrderItems> orders, int status) {
    return orders.where((order) => order.status == status).toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: MyOrderAppBar(
          controller: controller,
        ),
        body: FutureBuilder<List<OrderItems>>(
          future: futureOrderItems,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Error loading orders'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No orders available'));
            } else {
              final orders = snapshot.data!;
              return TabBarView(
                controller: controller,
                children: [
                  buildOrderList(filterOrdersByStatus(orders, 1)),
                  buildOrderList(filterOrdersByStatus(orders, 2)),
                  buildOrderList(filterOrdersByStatus(orders, 3)),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    return Ticker(onTick);
  }
}

Widget buildOrderList(List<OrderItems> orders) {
  if (orders.isEmpty) {
    return const Center(child: Text('No orders'));
  }
  return ListView.builder(
    itemCount: orders.length,
    itemBuilder: (context, index) {
      final order = orders[index];

      String orderStatus = '';
      for (int i = 0; i <= 3; i++) {
        if (order.status == i) {
          orderStatus = i == 1
              ? 'Delivered'
              : i == 2
                  ? 'Processing'
                  : 'Canceled';
        }
      }

      Color statusColor = order.status == 1
          ? AppColors.success
          : order.status == 2
              ? Colors.yellow
              : Colors.red;
      return Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF8A959E).withOpacity(0.3),
              blurRadius: 15,
              spreadRadius: 0,
              offset: const Offset(0, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 15, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Order No ${order.idOrder}',
                    style: AppTextStyles.nunito
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text(
                    order.date,
                    style: AppTextStyles.nunito
                        .copyWith(fontWeight: FontWeight.normal, fontSize: 14),
                  )
                ],
              ),
            ),
            const Divider(
              thickness: 3,
              color: Color(0xFFF0F0F0),
              height: 0,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 15, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text.rich(
                    TextSpan(
                      text: 'Quantity: ', // Default style for the first part
                      style: AppTextStyles.nunito.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${order.quantity}',
                          // Bold style for the order quantity
                          style: AppTextStyles.nunito.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text.rich(
                    TextSpan(
                      text: 'Total Amount: \$',
                      // Default style for the first part
                      style: AppTextStyles.nunito.copyWith(
                        fontWeight: FontWeight.normal,
                        fontSize: 16,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: '${order.totalAmount}',
                          // Bold style for the total amount
                          style: AppTextStyles.nunito.copyWith(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 15, 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FilledButton(
                      style: FilledButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text('Detail')),
                  Text(
                    orderStatus,
                    style: AppTextStyles.nunito.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: statusColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}

class MyOrderAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyOrderAppBar({
    super.key,
    required this.controller,
  });

  final TabController controller;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.only(left: 0),
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
        'My Order',
        style: AppTextStyles.gelasio.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.primary),
      ),
      bottom: TabBar(
        controller: controller,
        dividerColor: Colors.transparent,
        indicatorSize: TabBarIndicatorSize.label,
        indicatorWeight: 1,
        indicatorColor: AppColors.primary,
        indicatorPadding: const EdgeInsets.symmetric(horizontal: 10),
        tabs: const [
          Tab(
            text: 'Delivered',
          ),
          Tab(
            text: 'Processing',
          ),
          Tab(
            text: 'Canceled',
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
