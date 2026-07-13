import 'package:daza_store_commerce/features/dashboard/shipping_type/shipping_type_viewmodel.dart';
import 'package:daza_store_commerce/shared/widgets/button/button_view.dart';
import 'package:daza_store_commerce/styles/brand_color.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ShippingTypeView extends StatelessWidget {
  const ShippingTypeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ShippingTypeViewmodel>.reactive(
      viewModelBuilder: () => ShippingTypeViewmodel(),
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
            'Choose Shipping',
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
                      _ShippingCard(
                        type: 'Economy',
                        address: 'Estimated arrival 11 March 2026',
                        onTap: () {},
                      ),
                      _ShippingCard(
                        type: 'Cargo',
                        address: 'Estimated arrival 09 March 2026',
                        onTap: () {},
                      ),
                      _ShippingCard(
                        type: 'Express',
                        address: 'Estimated arrival 08 March 2026',
                        onTap: () {},
                      ),
                    ],
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

class _ShippingCard extends StatelessWidget {
  final VoidCallback onTap;
  final String type;
  final String address;

  const _ShippingCard({
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
