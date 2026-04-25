import 'package:daza_store_commerce/app/locator.dart';
import 'package:daza_store_commerce/features/auth/Login/view/login_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SignupViewModel extends ReactiveViewModel {
  final navigationService = locator<NavigationService>();

  void navigateToSignIn() {
    navigationService.navigateToView(LoginView());
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
