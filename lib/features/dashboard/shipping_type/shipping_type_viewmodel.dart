import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ShippingTypeViewmodel extends ReactiveViewModel {
  void setup() {}

  void goBack() {
    NavigationService().back();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
