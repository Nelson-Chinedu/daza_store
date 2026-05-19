import 'package:daza_store_commerce/app/locator.dart';
import 'package:daza_store_commerce/features/dashboard/dashboard_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NotificationViewmodel extends ReactiveViewModel {
  final NavigationService navigationService = locator<NavigationService>();

  void navigateToDashboard() {
    navigationService.navigateToView(DashboardView());
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
