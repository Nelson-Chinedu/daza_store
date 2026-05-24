// import 'package:daza_store_commerce/features/dashboard/home/home_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CartViewModel extends ReactiveViewModel {
  List<String> items = [
    'Nike Air Max',
    'Adidas Sneakers',
    'Puma Shoes',
    'New Balance',
    'New Balance',
    'New Balance',
    'New Balance',
    'New Balance',
    'New Balance',
  ];

  void removeItem(int index) {
    items.removeAt(index);
    notifyListeners();
  }

  void goBack() {
    NavigationService().back();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
