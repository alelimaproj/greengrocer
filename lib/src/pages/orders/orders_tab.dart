import 'package:flutter/material.dart';
import 'package:greengrocher/src/config/app_data.dart' as appData;
import 'package:greengrocher/src/pages/orders/components/order_title.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Orders',
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (_, index) => const SizedBox(
          height: 10,
        ),
        separatorBuilder: (_, index) => OrderTitle(order: appData.orders[index]),
        itemCount: appData.orders.length,
      ),
    );
  }
}
