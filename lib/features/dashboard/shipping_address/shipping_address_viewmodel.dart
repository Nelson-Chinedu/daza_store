import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ShippingAddressViewmodel extends ReactiveViewModel {
  void setup() {}

  void goBack() {
    NavigationService().back();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
