import 'package:flutter/material.dart';
import 'package:greengrocher/src/models/cart_item_model.dart';
import 'package:greengrocher/src/models/order_model.dart';
import 'package:greengrocher/src/pages/orders/components/order_status_widget.dart';
import 'package:greengrocher/src/services/utils_services.dart';

class OrderTitle extends StatelessWidget {
  final OrderModel order;

  OrderTitle({super.key, required this.order});

  final UtilsServices utilsServices = UtilsServices();
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Pedido: ${order.id}'),
              Text(
                utilsServices.formatDateTime(order.createdDateTime),
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.blue,
                ),
              ),
            ],
          ),
          childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            SizedBox(
              height: 150,
              child: Row(
                children: [

                  // lista de produtos
                  Expanded(
                      flex: 3,
                      child: ListView(
                        children: order.items.map((orderItem) {
                          return _OrderItemWidget(utilsServices: utilsServices,
                          orderItem: orderItem,
                          );
                        }).toList(),
                      ),
                  ),
                  // divisão

                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),

                  // status do pedido
                  Expanded(
                      flex: 2,
                      child: OrderStatusWidget(
                        status: order.status,
                        isOverDue: order.overdueDateTime.isBefore(DateTime.now()),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  const _OrderItemWidget({
    super.key,
    required this.utilsServices,
    required this.orderItem
  });

  final UtilsServices utilsServices;
  final CartItemModel orderItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            '${orderItem.quantity} ${orderItem.item.unit} ',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
              child: Text(orderItem.item.itemName)),
          Text(utilsServices.priceToCurrency(orderItem.totalPrice())),
        ],
      ),
    );
  }
}
