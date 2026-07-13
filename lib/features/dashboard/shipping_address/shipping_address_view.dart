import 'package:daza_store_commerce/features/dashboard/shipping_address/shipping_address_viewmodel.dart';
import 'package:daza_store_commerce/shared/widgets/button/button_view.dart';
import 'package:daza_store_commerce/styles/brand_color.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ShippingAddressView extends StatelessWidget {
  const ShippingAddressView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShippingAddressViewmodel>.reactive(
      viewModelBuilder: () => ShippingAddressViewmodel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: model.goBack,
              child: Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),
                child: const Icon(Icons.arrow_back_ios_sharp, size: 16),
              ),
            ),
          ),
          title: const Text(
            'Shipping Address',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: BrandColors.lightGrey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    spacing: 10,
                    children: [
                      _AddressCard(
                        type: 'Home',
                        address: '20 Somewhere street Lagos Nigeria',
                        onTap: () {},
                      ),
                      _AddressCard(
                        type: 'Office',
                        address: '780 Somewhere street Lagos Nigeria',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                DottedBorder(
                  options: RoundedRectDottedBorderOptions(
                    color: BrandColors.primary,
                    strokeWidth: 1.2,
                    dashPattern: [4, 3],
                    radius: Radius.circular(10),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Text(
                      'Add New Shipping Address',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: BrandColors.primary,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(
            left: 20,
            right: 20,
            top: 13,
            bottom: 35,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: BrandColors.lightGrey)),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Button(label: 'Continue', onPressed: () {}),
          ),
        ),
      ),
    );
  }
}

class _AddressCard extends StatelessWidget {
  final VoidCallback onTap;
  final String type;
  final String address;

  const _AddressCard({
    required this.onTap,
    required this.type,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: BrandColors.lightGrey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              spacing: 10,
              children: [
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: BrandColors.lightGrey),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(type, style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(address, style: TextStyle(fontSize: 12)),
                      // Text('Lagos Nigeria', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text('Radio button', style: TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}
