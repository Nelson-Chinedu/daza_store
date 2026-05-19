import 'package:stacked/stacked.dart';

class HomeViewmodel extends ReactiveViewModel {
  int currentIndex = 0;
  int selectedCategoryIndex = 0;

  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void selectedCategory(int index) {
    selectedCategoryIndex = index;
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
