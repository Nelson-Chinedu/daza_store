class Category {
  final String name;
  final String? iconPath;

  const Category({required this.name, this.iconPath});
}

const List<Category> categories = [
  Category(name: 'T-Shirt', iconPath: 'assets/images/t-shirt.png'),
  Category(name: 'Dress', iconPath: 'assets/images/dress.png'),
  Category(name: 'Jacket', iconPath: 'assets/images/jacket.png'),
  Category(name: 'Pants', iconPath: 'assets/images/pants.png'),
  Category(name: 'Shoes', iconPath: 'assets/images/shoes.png'),
];

final wishlistCategories = [Category(name: 'All'), ...categories];
