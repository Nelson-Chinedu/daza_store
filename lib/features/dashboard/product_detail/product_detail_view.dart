import 'package:cached_network_image/cached_network_image.dart';
import 'package:daza_store_commerce/features/dashboard/product_detail/product_detail_viewmodel.dart';
import 'package:daza_store_commerce/helpers/colorParser.dart';
import 'package:daza_store_commerce/shared/widgets/button/button_view.dart';
import 'package:daza_store_commerce/styles/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:stacked/stacked.dart';

class ProductDetailView extends StatelessWidget {
  final int productId;
  const ProductDetailView({super.key, required this.productId});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductDetailViewmodel>.reactive(
      viewModelBuilder: () => ProductDetailViewmodel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: BrandColors.lighterGrey,
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: GestureDetector(
                onTap: model.goBack,
                child: Container(
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey),
                  ),
                  child: const Icon(Icons.arrow_back_ios_sharp, size: 16),
                ),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsetsGeometry.only(right: 20),
                child: Row(
                  children: [
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Icon(
                        Icons.favorite_border_outlined,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 34,
                      height: 34,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey),
                      ),
                      child: const Icon(Icons.share, size: 16),
                    ),
                  ],
                ),
              ),
            ],
            backgroundColor: BrandColors.lighterGrey,
          ),
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.bottomCenter,
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
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Coats',
                              style: TextStyle(
                                fontSize: 14,
                                color: BrandColors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              '4.8 (365 reviews)',
                              style: TextStyle(
                                fontSize: 14,
                                color: BrandColors.dark,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Text(
                          'Brown Coat',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: sellerProfile(),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: productSize(model),
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: productColor(model),
                      ),
                      const SizedBox(height: 20),
                      Container(
                        decoration: BoxDecoration(
                          color: BrandColors.grey,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        padding: const EdgeInsets.only(top: 1),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Row(
                            spacing: 40,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Total Price',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: BrandColors.grey,
                                    ),
                                  ),
                                  const Text(
                                    "75.00",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: Button(
                                  label: 'Add to Cart',
                                  icon: Icons.shopping_bag_outlined,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget sellerProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 15,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Seller',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 5),
                Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(shape: BoxShape.circle),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.network(
                      'https://randomuser.me/api/portraits/thumb/men/75.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lesleigh Alexander',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: BrandColors.dark,
                  ),
                ),
                Text(
                  'Manager',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: BrandColors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          spacing: 10,
          children: [
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: BrandColors.lighterGrey,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.chat_bubble_outline,
                size: 18,
                color: BrandColors.primary,
              ),
            ),
            Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                color: BrandColors.lighterGrey,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.phone_in_talk_outlined,
                size: 18,
                color: BrandColors.primary,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget productSize(ProductDetailViewmodel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: 14,
              color: BrandColors.dark,
              fontWeight: FontWeight.w600,
            ),
            text: 'Size: ',
            children: [
              TextSpan(
                text: model.selectedSize,
                style: TextStyle(color: BrandColors.grey),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          spacing: 10,
          children: model.productSizes.map((size) {
            return GestureDetector(
              onTap: () => model.selectSize(size),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: model.selectedSize == size
                      ? BrandColors.primary
                      : BrandColors.lighterGrey,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  size,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: model.selectedSize == size
                        ? FontWeight.w600
                        : FontWeight.w400,
                    color: model.selectedSize == size
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget productColor(ProductDetailViewmodel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: TextStyle(
            fontSize: 14,
            color: BrandColors.dark,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          spacing: 10,
          children: model.productColors.map((color) {
            return GestureDetector(
              onTap: () => model.selectColor(color),
              child: Container(
                width: 32,
                height: 32,
                padding: EdgeInsets.all(3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: model.selectedColor == color
                        ? parseHexColor(color)
                        : Colors.transparent,
                    width: 2, // Border thickness
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: parseHexColor(color),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
