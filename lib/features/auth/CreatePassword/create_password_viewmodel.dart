import 'package:daza_store_commerce/app/locator.dart';
import 'package:daza_store_commerce/features/auth/Login/view/login_view.dart';
import 'package:daza_store_commerce/features/auth/OTP/otp_view.dart';
import 'package:flutter/widgets.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CreatePasswordViewModel extends ReactiveViewModel {
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();

  final navigationService = locator<NavigationService>();

  void navigateToSignIn() {
    navigationService.navigateToView(LoginView());
  }

  void navigateToOTP() {
    navigationService.navigateToView(OtpView());
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
