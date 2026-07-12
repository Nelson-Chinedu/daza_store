import 'package:daza_store_commerce/features/dashboard/cart/cart_viewmodel.dart';
import 'package:daza_store_commerce/shared/widgets/button/button_view.dart';
import 'package:daza_store_commerce/styles/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
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
            bottom: false,
            child: Column(
              children: [
                if (model.cartItems.isEmpty) ...[
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.5,
                    child: Center(
                      child: Text(
                        'Your cart is empty',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: BrandColors.grey,
                        ),
                      ),
                    ),
                  ),
                ] else ...[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: SlidableAutoCloseBehavior(
                        child: SlidableAutoCloseBehavior(
                          child: ListView.builder(
                            itemCount: model.cartItems.length,
                            itemBuilder: (context, index) {
                              final item = model.cartItems[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Slidable(
                                  key: ValueKey(item),
                                  endActionPane: ActionPane(
                                    motion: const BehindMotion(),
                                    extentRatio: 0.22,
                                    children: [
                                      SlidableAction(
                                        onPressed: (context) {
                                          deleteModal(
                                            context: context,
                                            model: model,
                                            index: index,
                                            item: item,
                                          );
                                        },
                                        backgroundColor: const Color(
                                          0xFFD65A5A,
                                        ),
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
                                        onTap: () =>
                                            Slidable.of(context)?.close(),
                                        child: Column(
                                          children: [
                                            _CartItem(item: item, model: model),
                                          ],
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
                  if (model.cartItems.isNotEmpty) _CartCharge(model: model),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Future deleteModal({
    required BuildContext context,
    required CartViewModel model,
    required int index,
    required Map<String, dynamic> item,
  }) {
    final height = MediaQuery.of(context).size.height * 0.35;
    return showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (context) {
        return Container(
          height: height,
          padding: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
          child: Column(
            children: [
              Text(
                'Remove from Cart?',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(8),
                // height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: BoxBorder.all(color: BrandColors.lightGrey),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Container(
                      height: 90,
                      width: 90,
                      decoration: BoxDecoration(
                        color: BrandColors.lightGrey,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 6,
                        children: [
                          Text(
                            item['product_name'],
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            item['category'],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: BrandColors.grey,
                            ),
                          ),

                          Row(
                            children: [
                              Text(
                                '₦${NumberFormat("#,##0", "en_US").format(item['new_price'])}',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                              SizedBox(width: 10),
                              Text(
                                '₦${NumberFormat("#,##0", "en_US").format(item['old_price'])}',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  color: BrandColors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                spacing: 5,
                children: [
                  Expanded(
                    child: Button(label: 'Cancel', onPressed: () {}),
                  ),
                  Expanded(
                    child: Button(
                      label: 'Yes, Remove',
                      onPressed: () {
                        Navigator.pop(context);
                        model.removeItem(item['id']);
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }
}

class _RowItems extends StatelessWidget {
  final String title;
  final dynamic amount;

  const _RowItems({required this.title, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(color: BrandColors.grey, fontSize: 12)),
        Text(
          '$amount',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
      ],
    );
  }
}

class _CartItem extends StatelessWidget {
  final Map<String, dynamic> item;
  final CartViewModel model;

  const _CartItem({required this.item, required this.model});

  @override
  Widget build(BuildContext context) {
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
                Text(
                  item['product_name'],
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 5),
                Text(item['category'], style: TextStyle(color: Colors.black45)),
                SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            'N${NumberFormat("#,##0", "en_US").format(item['new_price'])}',
                          ),
                          SizedBox(width: 10),
                          Text(
                            'N${NumberFormat("#,##0", "en_US").format(item['old_price'])}',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: BrandColors.lighterGrey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        spacing: 5,
                        children: [
                          GestureDetector(
                            onTap: () => model.decreaseQuantity(item['id']),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 7,
                              ),
                              decoration: BoxDecoration(
                                color: item['qty'] == 1
                                    ? Colors.white10
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                '-',
                                style: TextStyle(
                                  color: item['qty'] == 1
                                      ? Colors.grey.shade400
                                      : BrandColors.primary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                          // Text(model.cartItems[item['id']]['qty'].toString()),
                          Text(item['qty'].toString()),
                          GestureDetector(
                            onTap: () => model.increaseQuantity(item['id']),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                vertical: 2,
                                horizontal: 7,
                              ),
                              decoration: BoxDecoration(
                                color: BrandColors.primary,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                '+',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
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

class _CartCharge extends StatelessWidget {
  final CartViewModel model;
  const _CartCharge({required this.model});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          border: BoxBorder.all(color: BrandColors.lightGrey),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.02),
              blurRadius: 12,
              spreadRadius: 2,
              offset: const Offset(0, -2), // Shadow above the container
            ),
          ],
        ),
        child: Column(
          spacing: 10,
          children: [
            Stack(
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: BrandColors.lighterGrey,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: EdgeInsets.all(12),
                    hintText: 'Promo Code',
                    hintStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ),
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 0,
                    ),
                    child: Button(label: 'Apply', onPressed: () {}),
                  ),
                ),
              ],
            ),
            _RowItems(title: 'Sub-Total', amount: 'N3000'),
            _RowItems(title: 'Delivery Charge', amount: 'N30'),
            _RowItems(title: 'Tax', amount: 'N30'),
            _RowItems(title: 'Discount', amount: 'N30'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                20,
                (index) => Container(width: 8, height: 1, color: Colors.grey),
              ),
            ),
            _RowItems(
              title: 'Total Cost',
              amount: model.formattedTotalCartPrice,
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Button(
                label: 'Proceed to Checkout',
                onPressed: () {
                  model.proceedToCheckout();
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
