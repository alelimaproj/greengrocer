import 'package:flutter/material.dart';
import 'package:greengrocher/src/config/custom_colors.dart';

class CategoryTitle extends StatelessWidget {
  const CategoryTitle(
      {super.key,
      required this.category,
      required this.isSelected,
      required this.onPressed});

  final String category;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onPressed,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: isSelected
                ? CustomColors.customSwatchColor
                : Colors.transparent,
          ),
          child: Text(
            category,
            style: TextStyle(
              color:
                  isSelected ? Colors.white : CustomColors.customContrastColor,
              fontWeight: FontWeight.bold,
              fontSize: isSelected ? 16 : 14,
            ),
          ),
        ),
      ),
    );
  }
}
