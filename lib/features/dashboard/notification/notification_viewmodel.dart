import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class NotificationViewModel extends ReactiveViewModel {
  void goBack() {
    NavigationService().back();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
