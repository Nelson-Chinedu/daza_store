import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CartViewModel extends ReactiveViewModel {
  List<Map<String, dynamic>> cartItems = [
    {
      'id': 1,
      'product_name': 'Addida Sneakers',
      'old_price': 80000,
      'new_price': 20000,
      'category': 'Dress',
      'qty': 1,
    },
    {
      'id': 2,
      'product_name': 'Nike Sneakers',
      'old_price': 80000,
      'new_price': 30000,
      'category': 'Dress',
      'qty': 1,
    },
    {
      'id': 3,
      'product_name': 'Addidas cap',
      'old_price': 80000,
      'new_price': 40000,
      'category': 'Hat',
      'qty': 1,
    },
    {
      'id': 4,
      'product_name': 'Addidas short',
      'old_price': 80000,
      'new_price': 40000,
      'category': 'Dress',
      'qty': 1,
    },
  ];

  void removeItem(int index) {
    int itemId = index;
    cartItems.removeWhere((item) => item['id'] == itemId);
    notifyListeners();
  }

  void goBack() {
    NavigationService().back();
  }

  void increaseQuantity(int id) {
    int itemIndex = cartItems.indexWhere((item) => item['id'] == id);

    if (itemIndex != -1) {
      cartItems[itemIndex]['qty'] = (cartItems[itemIndex]['qty'] as int) + 1;
      notifyListeners();
    }
  }

  void decreaseQuantity(int id) {
    int itemIndex = cartItems.indexWhere((item) => item['id'] == id);

    if (itemIndex != -1) {
      if (cartItems[itemIndex]['qty'] == 1) {
        return;
      }
      cartItems[itemIndex]['qty'] = (cartItems[itemIndex]['qty'] as int) - 1;
      notifyListeners();
    }
  }

  double get totalCartPrice {
    double total = 0.0;

    for (var item in cartItems) {
      final rawPrice = item['new_price'];
      double price = 0.0;

      if (rawPrice is num) {
        price = rawPrice.toDouble();
      } else if (rawPrice is String) {
        price = double.tryParse(rawPrice) ?? 0.0;
      }
      int quantity = item['qty'] as int;
      total += price * quantity;
    }
    return total;
  }

  String get formattedTotalCartPrice {
    return 'N${NumberFormat("#,##0", "en_US").format(totalCartPrice)}';
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
