import 'package:daza_store_commerce/features/notification/notification_viewmodel.dart';
import 'package:daza_store_commerce/shared/widgets/button/button_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationViewmodel>.reactive(
      viewModelBuilder: () => NotificationViewmodel(),
      builder: (context, model, child) {
        return Scaffold(
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.shade200,
                      ),
                      child: Icon(Icons.notifications_none_outlined, size: 70),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Enable Notification Access',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Enable notifications to receive real-time updates.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: Button(
                        label: 'Allow Notification',
                        onPressed: () {},
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        foregroundColor: Color(0xFFF8B057),
                        textStyle: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: Text('Maybe Later'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
