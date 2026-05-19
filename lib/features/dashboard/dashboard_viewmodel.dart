import 'package:stacked/stacked.dart';

class DashboardViewmodel extends ReactiveViewModel {
  int currentIndex = 0;

  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
