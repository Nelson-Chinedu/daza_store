import 'package:daza_store_commerce/features/dashboard/account_view/account_view.dart';
import 'package:daza_store_commerce/features/dashboard/cart/cart_view.dart';
import 'package:daza_store_commerce/features/dashboard/home/home_view.dart';
import 'package:daza_store_commerce/features/dashboard/wishlist/wishlist_view.dart';
import 'package:daza_store_commerce/styles/brand_color.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  int currentIndex = 0;

  final List<Widget> pages = [
    HomeView(),
    CartView(),
    WishlistView(),
    HomeView(),
    AccountView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: BoxDecoration(color: BrandColors.dark),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _navItem(
                    outlined: Icons.home_outlined,
                    filled: Icons.home,
                    index: 0,
                  ),
                  // _navItem(
                  //   outlined: Icons.shopping_bag_outlined,
                  //   filled: Icons.shopping_bag,
                  //   index: 1,
                  // ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => CartView()),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  _navItem(
                    outlined: Icons.favorite_outline,
                    filled: Icons.favorite,
                    index: 2,
                  ),
                  _navItem(
                    outlined: Icons.message_outlined,
                    filled: Icons.message,
                    index: 3,
                  ),
                  _navItem(
                    outlined: Icons.person_outlined,
                    filled: Icons.person,
                    index: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData filled,
    required IconData outlined,
    required int index,
  }) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : Colors.grey.shade800,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          isSelected ? filled : outlined,
          color: isSelected ? BrandColors.primary : Colors.white,
          size: 30,
        ),
      ),
    );
  }
}
