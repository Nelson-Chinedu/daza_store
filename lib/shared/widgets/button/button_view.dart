import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String label;
  final Function onPressed;

  const Button({super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF401900),
        padding: EdgeInsets.all(15),
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(label, style: TextStyle(color: Colors.white)),
    );
  }
}
