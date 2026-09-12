import 'package:daza_store_commerce/features/dashboard/orders/active/active_view.dart';
import 'package:daza_store_commerce/features/dashboard/orders/cancelled/cancelled_view.dart';
import 'package:daza_store_commerce/features/dashboard/orders/completed/completed_view.dart';
import 'package:daza_store_commerce/features/dashboard/orders/orders_viewmodel.dart';
import 'package:daza_store_commerce/styles/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OrdersViewmodel>.reactive(
      viewModelBuilder: () => OrdersViewmodel(),
      builder: (context, model, child) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'My Orders',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              automaticallyImplyLeading: false,
              actions: [
                Container(
                  padding: EdgeInsets.all(6),
                  margin: EdgeInsets.only(right: 20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black),
                  ),
                  child: Icon(Icons.search_outlined, size: 25),
                ),
              ],
              backgroundColor: Colors.white,
            ),
            body: Column(
              children: [
                TabBar(
                  indicatorColor: BrandColors.primary,
                  overlayColor: WidgetStateProperty.all(Colors.transparent),
                  labelColor: BrandColors.primary,
                  tabs: [
                    Tab(text: 'Active'),
                    Tab(text: 'Completed'),
                    Tab(text: 'Cancelled'),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [ActiveView(), CompletedView(), CancelledView()],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
