import 'package:daza_store_commerce/core/constants/category.dart';
import 'package:daza_store_commerce/features/dashboard/product/product_view.dart';
import 'package:daza_store_commerce/features/dashboard/products/products_viewmodel.dart';
import 'package:daza_store_commerce/styles/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductsViewmodel>.reactive(
      viewModelBuilder: () => ProductsViewmodel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Products',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            actions: [
              Container(
                padding: EdgeInsets.all(6),
                margin: EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black),
                ),
                child: Icon(Icons.search_outlined, size: 25),
              ),
            ],
            backgroundColor: Colors.white,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20, top: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          spacing: 10,
                          children: List.generate(wishlistCategories.length, (
                            index,
                          ) {
                            final category = wishlistCategories[index];
                            return Padding(
                              padding: EdgeInsets.symmetric(horizontal: 0),
                              child: _categoryItem(model, category, index),
                            );
                          }),
                        ),
                      ),
                    ),
                    GridView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 15,
                            crossAxisSpacing: 15,
                            childAspectRatio: 0.7,
                          ),
                      itemBuilder: (context, index) {
                        return ProductView(
                          productId: index,
                          isFavourite: model.isFavourite(index),
                          onTap: () => model.toggleFavourite(index),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  _categoryItem(ProductsViewmodel model, dynamic category, int index) {
    return GestureDetector(
      onTap: () {
        model.selectedCategory(index);
      },
      child: Container(
        padding: EdgeInsets.only(
          left: index == 0 ? 20 : 5,
          right: index == 0 ? 20 : 18,
          top: index == 0 ? 10 : 4,
          bottom: index == 0 ? 10 : 4,
        ),
        decoration: BoxDecoration(
          color: model.selectedCategoryIndex == index
              ? BrandColors.primary
              : BrandColors.lighterGrey,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (category.iconPath != null)
              Container(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white12,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  category.iconPath,
                  width: 22,
                  height: 22,
                  color: model.selectedCategoryIndex == index
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            Text(
              category.name,
              style: TextStyle(
                color: model.selectedCategoryIndex == index
                    ? Colors.white
                    : Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
