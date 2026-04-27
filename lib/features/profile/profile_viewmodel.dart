import 'package:daza_store_commerce/app/locator.dart';
import 'package:daza_store_commerce/features/notification/notification_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProfileViewModel extends ReactiveViewModel {
  final NavigationService navigationService = locator<NavigationService>();

  void navigateToNotification() {
    navigationService.navigateToView(NotificationView());
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
