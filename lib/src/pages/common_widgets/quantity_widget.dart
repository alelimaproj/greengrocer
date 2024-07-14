import 'package:flutter/material.dart';
import 'package:greengrocher/src/config/custom_colors.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          )
        ],
      ),

      // icones
      child: Row(
        children: [
          // icone remover
          _QuantityButtom(
            icon: Icons.remove,
            color: Colors.grey,
            onPressed: () {},
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: const Text(
              "1Kg",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // icone add
          _QuantityButtom(
            icon: Icons.add,
            color: CustomColors.customSwatchColor,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _QuantityButtom extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onPressed;

  const _QuantityButtom({
    super.key,
    required this.color,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: onPressed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: const BoxDecoration(
            color: Colors.grey,
            shape: BoxShape.circle,
          ),
          // icone
          child: Icon(
            icon,
            color: color,
            size: 16,
          ),
        ),
      ),
    );
  }
}
