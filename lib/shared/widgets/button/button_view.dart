import 'package:daza_store_commerce/styles/brand_color.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;

  const Button({super.key, required this.label, this.onPressed});

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
      child: Text(label, style: TextStyle(color: Colors.white)),
    );
  }
}
