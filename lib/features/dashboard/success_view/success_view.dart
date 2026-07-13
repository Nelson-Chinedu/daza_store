import 'package:daza_store_commerce/features/dashboard/success_view/success_viewmodel.dart';
import 'package:daza_store_commerce/shared/widgets/button/button_view.dart';
import 'package:daza_store_commerce/styles/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SuccessView extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onPrimaryButtonPressed;
  final VoidCallback? onSecondaryButtonPressed;

  const SuccessView({
    super.key,
    required this.title,
    required this.description,
    required this.onPrimaryButtonPressed,
    this.onSecondaryButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SuccessViewmodel>.reactive(
      viewModelBuilder: () => SuccessViewmodel(),
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
            backgroundColor: Colors.white,
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text(
                    title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    description,
                    style: TextStyle(fontSize: 16, color: BrandColors.grey),
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              spacing: 10,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Button(
                    label: 'View Order',
                    onPressed: onPrimaryButtonPressed,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Button(
                    label: 'View',
                    onPressed: onSecondaryButtonPressed ?? () {},
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
