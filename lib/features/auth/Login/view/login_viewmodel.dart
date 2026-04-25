import 'package:daza_store_commerce/app/locator.dart';
import 'package:daza_store_commerce/features/auth/Signup/view/signup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends ReactiveViewModel {
  final navigationService = locator<NavigationService>();

  void navigateToSignUp() {
    navigationService.navigateToView(SignupView());
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
