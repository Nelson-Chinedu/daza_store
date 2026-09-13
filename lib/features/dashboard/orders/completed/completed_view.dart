import 'package:cached_network_image/cached_network_image.dart';
import 'package:daza_store_commerce/features/dashboard/orders/review/review_view.dart';
import 'package:daza_store_commerce/features/dashboard/orders/review/view_e_receipt/view_e_receipt_view.dart';
import 'package:daza_store_commerce/shared/widgets/button/button_view.dart';
import 'package:daza_store_commerce/styles/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked_services/stacked_services.dart';

class CompletedView extends StatelessWidget {
  const CompletedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListView.separated(
        itemCount: 4,
        separatorBuilder: (context, index) => const SizedBox(),
        itemBuilder: (context, index) {
          return Align(
            alignment: Alignment.topCenter,
            child: Container(
              padding: const EdgeInsets.all(
                12,
              ), // Adds padding inside the border
              margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: BoxBorder.all(color: BrandColors.lightGrey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 14,
                            color: BrandColors.grey,
                            fontWeight: FontWeight.w400,
                          ),
                          text: 'Order ID : ',
                          children: [
                            TextSpan(
                              text: '#29929292',
                              style: TextStyle(
                                color: BrandColors.primary,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade100,
                          border: Border.all(
                            color: Colors.greenAccent,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Text('Completed Order'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Divider(color: BrandColors.lightGrey),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png',
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.contain,
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: Container(
                                color: Colors.white,
                                width: double.infinity,
                                height: double.infinity,
                              ),
                            ),
                            errorWidget: (context, url, error) => Container(
                              color: Colors.grey[200],
                              child: const Icon(
                                Icons.broken_image,
                                color: Colors.grey,
                                size: 32,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 5,
                        children: [
                          Text(
                            'Modern Party Dress',
                            style: TextStyle(
                              color: BrandColors.primary,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            'Dress | Size : M | Qty : 1',
                            style: TextStyle(
                              fontSize: 12,
                              color: BrandColors.grey,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber),
                              Text(
                                '5.0',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '\$80.00',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    spacing: 10,
                    children: [
                      Flexible(
                        child: Button(
                          label: 'Leave Review',
                          onPressed: () =>
                              NavigationService().navigateToView(ReviewView()),
                        ),
                      ),
                      Flexible(
                        child: Button(
                          label: 'View E-Receipt',
                          onPressed: () => NavigationService().navigateToView(
                            EReceiptView(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
