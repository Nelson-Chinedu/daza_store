// import 'package:daza_store_commerce/features/auth/Login/view/login_view.dart';
// import 'package:daza_store_commerce/features/auth/Signup/view/signup_view.dart';
import 'package:daza_store_commerce/app/locator.dart';
import 'package:daza_store_commerce/features/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked_services/stacked_services.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daza Store',
      navigatorKey: StackedService.navigatorKey,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: RootScreen(),
    );
  }
}

class RootScreen extends StatefulWidget {
  const RootScreen({super.key});

  @override
  State<RootScreen> createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    if (isLoggedIn) {
      return const Text('Homescreen');
    } else {
      return const OnboardingView();
    }
  }
}
