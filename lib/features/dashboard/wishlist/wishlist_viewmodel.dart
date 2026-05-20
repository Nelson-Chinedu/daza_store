import 'package:stacked/stacked.dart';

class WishlistViewmodel extends ReactiveViewModel {
  int selectedCategoryIndex = 0;

  void selectedCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
