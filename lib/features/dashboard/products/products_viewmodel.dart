import 'package:stacked/stacked.dart';

class ProductsViewmodel extends ReactiveViewModel {
  int selectedCategoryIndex = 0;

  final List<int> _favourites = [];
  List<int> get favourites => List.unmodifiable(_favourites);

  bool isFavourite(int item) => _favourites.contains(item);

  void selectedCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  bool toggleFavourite(int item) {
    bool isAdded;
    if (_favourites.contains(item)) {
      _favourites.remove(item);
      isAdded = false;
    } else {
      _favourites.add(item);
      isAdded = true;
    }
    notifyListeners();
    return isAdded;
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
