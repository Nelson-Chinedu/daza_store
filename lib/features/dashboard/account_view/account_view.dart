import 'package:daza_store_commerce/features/dashboard/account_view/account_viewmodel.dart';
import 'package:daza_store_commerce/styles/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class AccountView extends StatelessWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AccountViewModel>.reactive(
      viewModelBuilder: () => AccountViewModel(),
      builder: (context, model, child) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.arrow_back_ios_sharp, size: 20),
                            ),
                          ),
                        ),
                      ),
                      Center(
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: 145,
                        height: 145,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade100,
                        ),
                        child: Icon(Icons.person_2_outlined, size: 60),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: BrandColors.primary,
                          ),
                          child: Icon(
                            Icons.edit_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  const Text(
                    'John Doe',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  accountSetup(
                    name: 'Your profile',
                    path: '',
                    icon: Icons.person,
                  ),
                  accountSetup(
                    name: 'Manage Address',
                    path: '',
                    icon: Icons.house,
                  ),
                  accountSetup(
                    name: 'Payment Methods',
                    path: '',
                    icon: Icons.payment,
                  ),
                  accountSetup(
                    name: 'My Orders',
                    path: '',
                    icon: Icons.shopping_bag,
                  ),
                  accountSetup(
                    name: 'My Coupons',
                    path: '',
                    icon: Icons.card_giftcard,
                  ),
                  accountSetup(name: 'My Wallet', path: '', icon: Icons.wallet),
                  accountSetup(
                    name: 'Settings',
                    path: '',
                    icon: Icons.settings,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget accountSetup({
    required String name,
    required dynamic icon,
    required String path,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.5, color: BrandColors.lightGrey),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Row(
              spacing: 14,
              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: BrandColors.lightGrey.withValues(alpha: 0.4),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: BrandColors.grey),
                ),
                Text(
                  name,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Icon(Icons.arrow_forward_ios, color: BrandColors.secondary, size: 20),
        ],
      ),
    );
  }
}
