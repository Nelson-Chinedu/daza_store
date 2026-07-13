import 'package:daza_store_commerce/features/dashboard/shipping_address/shipping_address_view.dart';
import 'package:daza_store_commerce/features/dashboard/shipping_type/shipping_type_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CheckoutViewModel extends ReactiveViewModel {
  void setup() {}

  void goBack() {
    NavigationService().back();
  }

  void changeCheckout(String type) {
    if (type == 'shipping_address') {
      NavigationService().navigateToView(ShippingAddressView());
    } else if (type == 'shipping_type') {
      NavigationService().navigateToView(ShippingTypeView());
    }
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
