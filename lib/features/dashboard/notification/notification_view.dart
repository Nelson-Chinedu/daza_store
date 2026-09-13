import 'package:daza_store_commerce/features/dashboard/notification/notification_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NotificationViewModel>.reactive(
      viewModelBuilder: () => NotificationViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            scrolledUnderElevation: 0,
            surfaceTintColor: Colors.transparent,
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
              'Notification',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            centerTitle: true,
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF3E2723),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Text(
                    '2 NEW',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            children: [
              _SectionHeader(title: 'TODAY', onMarkAllRead: () {}),
              const SizedBox(height: 12),
              const _NotificationTile(
                icon: Icons.local_shipping_outlined,
                title: 'Order Shipped',
                time: '1h',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                highlightIconBg: true,
              ),
              const _NotificationTile(
                icon: Icons.local_offer_outlined,
                title: 'Flash Sale Alert',
                time: '1h',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ),
              const _NotificationTile(
                icon: Icons.star_border_rounded,
                title: 'Product Review Request',
                time: '1h',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis',
                showDivider: false,
              ),
              const SizedBox(height: 24),

              _SectionHeader(title: 'YESTERDAY', onMarkAllRead: () {}),
              const SizedBox(height: 12),
              const _NotificationTile(
                icon: Icons.local_shipping_outlined,
                title: 'Order Shipped',
                time: '1d',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                highlightIconBg: true,
              ),
              const _NotificationTile(
                icon: Icons.account_balance_wallet_outlined,
                title: 'New Paypal Added',
                time: '1d',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
              ),
              const _NotificationTile(
                icon: Icons.local_offer_outlined,
                title: 'Flash Sale Alert',
                time: '1d',
                description:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                showDivider: false,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onMarkAllRead;

  const _SectionHeader({required this.title, required this.onMarkAllRead});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade600,
            letterSpacing: 0.8,
          ),
        ),
        GestureDetector(
          onTap: onMarkAllRead,
          child: const Text(
            'Mark all as read',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: Color(0xFFE5A66B),
            ),
          ),
        ),
      ],
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String time;
  final String description;
  final bool highlightIconBg;
  final bool showDivider;

  const _NotificationTile({
    required this.icon,
    required this.title,
    required this.time,
    required this.description,
    this.highlightIconBg = false,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Circular Icon
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: highlightIconBg
                      ? const Color(0xFFFAF2EB)
                      : const Color(0xFFF7F7F7),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, size: 22, color: const Color(0xFF3E2723)),
              ),
              const SizedBox(width: 14),

              // Notification Title, Description & Time
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey.shade400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: 12.5,
                        height: 1.35,
                        color: Colors.grey.shade500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        if (showDivider)
          Divider(height: 1, thickness: 1, color: Colors.grey.shade100),
      ],
    );
  }
}
