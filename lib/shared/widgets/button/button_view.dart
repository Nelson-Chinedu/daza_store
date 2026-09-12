import 'package:daza_store_commerce/styles/brand_color.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final double? iconSize;

  const Button({
    super.key,
    required this.label,
    this.onPressed,
    this.icon,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: BrandColors.primary,
        padding: EdgeInsets.all(15),
      ),
      onPressed: () {
        onPressed!();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
          if (icon != null)
            Icon(icon, color: Colors.white, size: iconSize ?? 25),
          Text(label, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
