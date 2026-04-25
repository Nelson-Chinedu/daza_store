import 'package:daza_store_commerce/app/locator.dart';
import 'package:daza_store_commerce/features/auth/Login/view/login_view.dart';
import 'package:daza_store_commerce/features/auth/Signup/view/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OnboardingViewmodel extends ReactiveViewModel {
  bool isGettingStarted = false;
  int currentPage = 0;

  final PageController controller = PageController();
  final navigationService = locator<NavigationService>();

  void init() {
    controller.addListener(() {
      final page = controller.page?.round() ?? 0;
      if (page != currentPage) {
        currentPage = page;
        notifyListeners();
      }
    });
  }

  void onGetStarted() {
    isGettingStarted = !isGettingStarted;
    notifyListeners();
  }

  void next() {
    if (!controller.hasClients) return;

    controller.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void previous() {
    if (!controller.hasClients) return;

    controller.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void onPageChanged(int index) {
    currentPage = index;
    notifyListeners();
  }

  void navigateToSignUp() {
    navigationService.navigateToView(SignupView());
  }

  void navigateToSignIn() {
    navigationService.navigateToView(LoginView());
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
