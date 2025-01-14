import 'package:flutter/material.dart';
import 'package:greengrocher/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverDue;

  const OrderStatusWidget(
      {super.key, required this.status, required this.isOverDue});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_StatusDot(isActive: true, title: 'Teste pagamento',),
        _StatusDot(isActive: true, title: 'Pagamento efetuado',)],
    );
  }
}

class _StatusDot extends StatelessWidget {
  final bool isActive;
  final String title;

  const _StatusDot({super.key, required this.isActive, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // dot 
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: CustomColors.customSwatchColor,
            ),
            color:
                isActive ? CustomColors.customSwatchColor : Colors.transparent,
          ),
          child: isActive
              ? const Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : const SizedBox.shrink(),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Text(
            title
          ),
        )
      ],
    );
  }
}
