import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ReviewViewmodel extends ReactiveViewModel {
  void setup() {}

  void goBack() {
    NavigationService().back();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
