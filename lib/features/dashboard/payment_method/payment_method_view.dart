import 'package:daza_store_commerce/features/dashboard/payment_method/payment_method_viewmodel.dart';
import 'package:daza_store_commerce/shared/widgets/button/button_view.dart';
import 'package:daza_store_commerce/styles/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class PaymentMethodView extends StatelessWidget {
  const PaymentMethodView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PaymentMethodViewModel>.reactive(
      viewModelBuilder: () => PaymentMethodViewModel(),
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
            'Payment Methods',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          backgroundColor: Colors.white,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text(
                      'Cash',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    _PaymentMethod(type: 'Cash', onTap: () {}),
                    const SizedBox(height: 5),
                    Text(
                      'Wallet',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    _PaymentMethod(type: 'Wallet', onTap: () {}),
                    const SizedBox(height: 5),
                    Text(
                      'Credit & Debit Card',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    _PaymentMethod(type: 'Add Card', onTap: () {}),
                  ],
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
            child: Button(
              label: 'Confirm Payment',
              onPressed: () {
                model.confirmPayment();
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _PaymentMethod extends StatelessWidget {
  final VoidCallback onTap;
  final String type;

  const _PaymentMethod({required this.onTap, required this.type});

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
                      Text(
                        type,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: BrandColors.grey,
                        ),
                      ),
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
