import 'package:daza_store_commerce/features/dashboard/checkout/checkout_viewmodel.dart';
import 'package:daza_store_commerce/shared/widgets/button/button_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CheckoutViewModel>.reactive(
      viewModelBuilder: () => CheckoutViewModel(),
      builder: (context, model, child) {
        return Scaffold(
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
              'Checkout',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            backgroundColor: Colors.white,
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Shipping Address',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    _SummaryCard(),
                    const SizedBox(height: 20),
                    Text(
                      'Choose Shipping Type',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    _SummaryCard(),
                    const SizedBox(height: 20),
                    Text(
                      'Order List',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    _OrderList(),
                  ],
                ),
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
              border: Border(top: BorderSide(color: Colors.grey.shade300)),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: SizedBox(
              width: double.infinity,
              child: Button(label: 'Continue to Payment', onPressed: () {}),
            ),
          ),
        );
      },
    );
  }
}

class _SummaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
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
                    border: Border.all(color: Colors.grey),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Home',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '20 Somewhere street',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text('Lagos Nigeria', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text('CHANGE', style: TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}

class _OrderList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _OrderItem(),
          Divider(color: Colors.grey.shade300),
          _OrderItem(),
          Divider(color: Colors.grey.shade300),
          _OrderItem(),
        ],
      ),
    );
  }
}

class _OrderItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 90,
          height: 90,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Modern Party Dress'),
            Text('Dress'),
            Text('N30,000'),
          ],
        ),
      ],
    );
  }
}
