import 'package:daza_store_commerce/features/dashboard/account_view/account_viewmodel.dart';
import 'package:daza_store_commerce/features/dashboard/orders/orders_view.dart';
import 'package:daza_store_commerce/features/dashboard/payment_method/payment_method_view.dart';
import 'package:daza_store_commerce/shared/widgets/button/button_view.dart';
import 'package:daza_store_commerce/styles/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

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
                  const SizedBox(height: 20),
                  Stack(
                    children: [
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
                  const SizedBox(height: 20),
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
                  accountSetup(name: 'Your profile', icon: Icons.person),
                  accountSetup(name: 'Manage Address', icon: Icons.house),
                  accountSetup(
                    name: 'Payment Methods',

                    icon: Icons.payment,
                    onTap: () =>
                        NavigationService().navigateToView(PaymentMethodView()),
                  ),
                  accountSetup(
                    name: 'My Orders',

                    icon: Icons.shopping_bag,
                    onTap: () =>
                        NavigationService().navigateToView(OrdersView()),
                  ),
                  accountSetup(name: 'My Coupons', icon: Icons.card_giftcard),
                  accountSetup(name: 'My Wallet', icon: Icons.wallet),
                  accountSetup(name: 'Settings', icon: Icons.settings),
                  accountSetup(
                    name: 'Logout',
                    icon: Icons.logout,
                    onTap: () => _showLogoutBottomSheet(context),
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
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
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
            Icon(
              Icons.arrow_forward_ios,
              color: BrandColors.secondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(24),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 20),

              const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 16),
              Divider(color: Colors.grey.shade200, height: 1),
              const SizedBox(height: 24),

              Text(
                'Are you sure you want to log out?',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey.shade600,
                ),
              ),
              const SizedBox(height: 28),

              Row(
                spacing: 20,
                children: [
                  Expanded(child: Button(label: 'Cancel')),

                  Expanded(child: Button(label: 'Yes, Logout')),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        );
      },
    );
  }
}
