import 'package:flutter/material.dart';

class SocialAuth extends StatelessWidget {
  const SocialAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE0E0E0)),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image(
                image: AssetImage('assets/images/google.png'),
                height: 25,
              ),
            ),
            const SizedBox(width: 15),
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xFFE0E0E0)),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Image(
                image: AssetImage('assets/images/facebook.png'),
                height: 30,
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(child: Divider(color: Colors.grey)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text('Or sign in with'),
              ),
              Expanded(child: Divider(color: Colors.grey)),
            ],
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
