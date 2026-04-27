import 'package:daza_store_commerce/app/locator.dart';
import 'package:daza_store_commerce/features/auth/CreatePassword/create_password_view.dart';
import 'package:daza_store_commerce/features/auth/ForgotPassword/forgot_password_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class OtpViewModel extends ReactiveViewModel {
  final navigationService = locator<NavigationService>();

  void navigateToOtp() {
    navigationService.navigateToView(ForgotPasswordView());
  }

  void navigateToCreatePassword() {
    navigationService.navigateToView(CreatePasswordView());
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
