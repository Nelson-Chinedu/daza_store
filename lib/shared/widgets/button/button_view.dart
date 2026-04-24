import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;

  const Button({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF401900),
        padding: EdgeInsets.all(15),
      ),
      onPressed: () {},
      child: Text(label, style: TextStyle(color: Colors.white)),
    );
  }
}
