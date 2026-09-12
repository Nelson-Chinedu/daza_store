import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ProductDetailViewmodel extends ReactiveViewModel {
  final List<String> productSizes = ['S', 'M', 'L', 'XL', 'XXL'];
  final List<String> productColors = [
    '795548',
    'FFEB3B',
    'FF9800',
    '2196F3',
    '9E9E9E',
  ];

  String _selectedSize = '';
  String get selectedSize => _selectedSize;

  String _selectedColor = '';
  String get selectedColor => _selectedColor;

  void setup() {}

  void goBack() {
    NavigationService().back();
  }

  void selectSize(String size) {
    _selectedSize = size;
    notifyListeners();
  }

  void selectColor(String color) {
    _selectedColor = color;
    notifyListeners();
  }

  @override
  List<ListenableServiceMixin> get listenableServices => [];
}
