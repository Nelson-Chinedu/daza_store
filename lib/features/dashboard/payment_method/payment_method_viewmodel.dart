import 'package:daza_store_commerce/features/dashboard/success_view/success_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class PaymentMethodViewModel extends ReactiveViewModel {
  void setup() {}

  void goBack() {
    NavigationService().back();
  }

  void confirmPayment() {
    NavigationService().navigateToView(
      SuccessView(
        title: 'Payment Successful!',
        description: 'Thank you for your purchase',
        onPrimaryButtonPressed: () {
          print('work');
        },
      ),
    );
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
