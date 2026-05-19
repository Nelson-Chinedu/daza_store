import 'package:carousel_slider/carousel_slider.dart';
import 'package:daza_store_commerce/core/constants/category.dart';
import 'package:daza_store_commerce/features/dashboard/home/home_viewmodel.dart';
import 'package:daza_store_commerce/styles/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewmodel>.reactive(
      viewModelBuilder: () => HomeViewmodel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: BrandColors.primary,
            automaticallyImplyLeading: false,
            systemOverlayStyle: SystemUiOverlayStyle.light,
            toolbarHeight: 0,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(color: BrandColors.primary),
                  child: Padding(
                    padding: EdgeInsets.only(top: 20, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Location',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  'Lagos, NG',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            Container(
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                shape: BoxShape.rectangle,
                                color: Colors.white38,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Icon(
                                Icons.notifications_outlined,
                                size: 28,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  vertical: 12,
                                  horizontal: 12,
                                ),
                                decoration: BoxDecoration(
                                  color: BrandColors.secondary,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 30,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                specialOffers(context, model),
                shopByCategory(context, model),
                bestSellerProduct(context, model),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget specialOffers(BuildContext context, HomeViewmodel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Special Offers',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: TextStyle(color: BrandColors.secondary),
                ),
              ),
            ],
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 150.0,
              enableInfiniteScroll: true,
              autoPlay: true,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                model.updateIndex(index);
              },
            ),

            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(
                      color: BrandColors.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        'Offer Ad $i',
                        style: TextStyle(fontSize: 16.0, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) {
              return AnimatedContainer(
                duration: Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: model.currentIndex == index
                      ? BrandColors.secondary
                      : Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget shopByCategory(BuildContext context, HomeViewmodel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Shop by Category',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: TextStyle(color: BrandColors.secondary),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 10,
              children: List.generate(categories.length, (index) {
                final category = categories[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  child: _categoryItem(model, category, index),
                );
              }),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget bestSellerProduct(BuildContext context, HomeViewmodel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Best Seller Product',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'See all',
                  style: TextStyle(color: BrandColors.secondary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Column(
            spacing: 20,
            children: List.generate(2, (index) {
              return Row(
                spacing: 15,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 250,
                      width: 250,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: 250,
                      width: 250,
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }

  _categoryItem(HomeViewmodel model, dynamic category, int index) {
    return GestureDetector(
      onTap: () {
        model.selectedCategory(index);
      },
      child: Container(
        padding: EdgeInsets.only(left: 5, right: 18, top: 4, bottom: 4),
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
