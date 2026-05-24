import 'package:daza_store_commerce/features/dashboard/cart/cart_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:stacked/stacked.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CartViewModel>.reactive(
      viewModelBuilder: () => CartViewModel(),

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
              'My Cart',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            backgroundColor: Colors.white,
          ),

          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: SlidableAutoCloseBehavior(
                child: SlidableAutoCloseBehavior(
                  child: ListView.builder(
                    itemCount: model.items.length,
                    itemBuilder: (context, index) {
                      final item = model.items[index];

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Slidable(
                          key: ValueKey(item),

                          endActionPane: ActionPane(
                            motion: const BehindMotion(),
                            extentRatio: 0.22,
                            children: [
                              SlidableAction(
                                onPressed: (_) => model.removeItem(index),
                                backgroundColor: const Color(0xFFD65A5A),
                                icon: Icons.delete_outline,
                                foregroundColor: Colors.white,
                                borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                              ),
                            ],
                          ),

                          child: Builder(
                            builder: (context) {
                              return GestureDetector(
                                onTap: () => Slidable.of(context)?.close(),
                                child: Column(
                                  children: [cartItem(itemName: item)],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget cartItem({required String itemName}) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(itemName, style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(height: 5),
                Text('Dress', style: TextStyle(color: Colors.black45)),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text('₦80.00'),
                    SizedBox(width: 10),
                    Text(
                      '₦100.00',
                      style: TextStyle(decoration: TextDecoration.lineThrough),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
