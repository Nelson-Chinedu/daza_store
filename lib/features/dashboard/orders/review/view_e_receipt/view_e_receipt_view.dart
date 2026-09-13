import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class EReceiptView extends StatelessWidget {
  const EReceiptView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: GestureDetector(
            onTap: () => Navigator.maybePop(context),
            child: Container(
              width: 34,
              height: 34,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: const Icon(Icons.arrow_back_ios_sharp, size: 16),
            ),
          ),
        ),
        title: const Text(
          'E-Receipt',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const Icon(Icons.download_rounded, size: 18),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Products',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  const _ReceiptProductRow(
                    title: 'Modern Party Dress',
                    category: 'Dress',
                    price: '\$80.00',
                    originalPrice: '\$100.00',
                    imageUrl:
                        'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png',
                  ),
                  Divider(height: 24, color: Colors.grey.shade200),
                  const _ReceiptProductRow(
                    title: 'White Shirt',
                    category: 'Shirt',
                    price: '\$70.00',
                    originalPrice: '\$100.00',
                    imageUrl:
                        'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png',
                  ),
                  Divider(height: 24, color: Colors.grey.shade200),
                  const _ReceiptProductRow(
                    title: 'Brown Coat',
                    category: 'Coats',
                    price: '\$75.00',
                    originalPrice: '\$150.00',
                    imageUrl:
                        'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_t.png',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Order Details',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Expanded(
                        child: _DetailTile(
                          label: 'Order ID',
                          value: '#FN854568',
                          isBoldValue: true,
                        ),
                      ),
                      Expanded(
                        child: _DetailTile(
                          label: 'Customer Name',
                          value: 'Jennifer Aaker',
                          isBoldValue: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: const [
                      Expanded(
                        child: _DetailTile(
                          label: 'Phone',
                          value: '+1 (208) 555-0112',
                          isBoldValue: true,
                        ),
                      ),
                      Expanded(
                        child: _DetailTile(
                          label: 'Promo Code',
                          value: 'FN8954YRGHD',
                          isBoldValue: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Expanded(
                        child: _DetailTile(
                          label: 'Payment Methods',
                          value: 'Wallet',
                          isBoldValue: true,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Transaction ID',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey.shade500,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                const Text(
                                  'TR8564RTHG',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                Icon(
                                  Icons.copy_rounded,
                                  size: 14,
                                  color: Colors.brown.shade400,
                                ),
                              ],
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
      ),
    );
  }
}

class _ReceiptProductRow extends StatelessWidget {
  final String title;
  final String category;
  final String price;
  final String originalPrice;
  final String imageUrl;

  const _ReceiptProductRow({
    required this.title,
    required this.category,
    required this.price,
    required this.originalPrice,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            width: 60,
            height: 60,
            fit: BoxFit.cover,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Container(color: Colors.white),
            ),
            errorWidget: (context, url, error) => Container(
              color: Colors.grey[200],
              child: const Icon(Icons.image, color: Colors.grey),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                category,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Text(
                    originalPrice,
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey.shade400,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DetailTile extends StatelessWidget {
  final String label;
  final String value;
  final bool isBoldValue;

  const _DetailTile({
    required this.label,
    required this.value,
    this.isBoldValue = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 13,
            fontWeight: isBoldValue ? FontWeight.w600 : FontWeight.normal,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
