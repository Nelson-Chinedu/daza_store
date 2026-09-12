import 'package:cached_network_image/cached_network_image.dart';
import 'package:daza_store_commerce/helpers/format_string.dart';
import 'package:daza_store_commerce/styles/brand_color.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductView extends StatelessWidget {
  final int productId;
  final dynamic isFavourite;
  final VoidCallback? onTap;

  const ProductView({
    super.key,
    required this.productId,
    this.isFavourite,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5,
      children: [
        Stack(
          alignment: Alignment.topRight,
          children: [
            AspectRatio(
              aspectRatio: 16 / 15,
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
            Container(
              padding: EdgeInsets.all(5),
              margin: EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white54,
              ),
              child: GestureDetector(
                onTap: onTap,
                child: Icon(
                  isFavourite == true ? Icons.favorite : Icons.favorite_outline,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  truncateString('Brown'),
                  style: TextStyle(
                    color: BrandColors.dark,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'Coats',
                  style: TextStyle(
                    color: BrandColors.grey,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Row(
                  spacing: 10,
                  children: [
                    Text(
                      '\$75.00',
                      style: TextStyle(
                        color: BrandColors.dark,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      '\$85.00',
                      style: TextStyle(
                        color: BrandColors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 2,
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                Text(
                  '4.8',
                  style: TextStyle(
                    color: BrandColors.dark,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
