import 'package:daza_store_commerce/features/dashboard/orders/review/leave_review/leave_review_view.dart';
import 'package:daza_store_commerce/features/dashboard/orders/review/review_viewmodel.dart';
import 'package:daza_store_commerce/shared/widgets/button/button_view.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ReviewView extends StatelessWidget {
  const ReviewView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ReviewViewmodel>.reactive(
      viewModelBuilder: () => ReviewViewmodel(),
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            surfaceTintColor: Colors.transparent,
            scrolledUnderElevation: 0,
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
              'Review',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            backgroundColor: Colors.white,
          ),
          body: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            itemCount: 5, // 1 header item + 4 review cards
            separatorBuilder: (context, index) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              // 1. Header: Rating Summary Section
              if (index == 0) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Left Column: Average Score
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                '4.8',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  5,
                                  (index) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 18,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                '(107 Reviews)',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Divider between sides
                        const VerticalDivider(
                          color: Colors.grey,
                          thickness: 0.8,
                          width: 32,
                        ),

                        // Right Column: Rating Bars (5 to 1)
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              _RatingBarRow(starNumber: '5', progress: 0.8),
                              SizedBox(height: 6),
                              _RatingBarRow(starNumber: '4', progress: 0.6),
                              SizedBox(height: 6),
                              _RatingBarRow(starNumber: '3', progress: 0.3),
                              SizedBox(height: 6),
                              _RatingBarRow(starNumber: '2', progress: 0.15),
                              SizedBox(height: 6),
                              _RatingBarRow(starNumber: '1', progress: 0.05),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return const ReviewCard(
                userName: 'Leslie Alexander',
                userImageUrl: 'https://i.pravatar.cc/150?img=47',
                timeAgo: '1 months ago',
                reviewText:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt',
                rating: 5.0,
                isVerified: true,
              );
            },
          ),
          bottomNavigationBar: Container(
            padding: const EdgeInsets.only(
              top: 15,
              bottom: 30,
              left: 20,
              right: 20,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 10,
                  spreadRadius: 0,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: Button(
              label: 'Write Review',
              onPressed: () =>
                  NavigationService().navigateToView(LeaveReviewView()),
            ),
          ),
        );
      },
    );
  }
}

class _RatingBarRow extends StatelessWidget {
  final String starNumber;
  final double progress;

  const _RatingBarRow({required this.starNumber, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 12,
          child: Text(
            starNumber,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
          ),
        ),

        const SizedBox(width: 8),
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              color: Colors.brown,
              backgroundColor: Colors.grey[200],
            ),
          ),
        ),
      ],
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String userName;
  final String userImageUrl;
  final String timeAgo;
  final String reviewText;
  final double rating;
  final bool isVerified;

  const ReviewCard({
    super.key,
    required this.userName,
    required this.userImageUrl,
    required this.timeAgo,
    required this.reviewText,
    required this.rating,
    this.isVerified = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(userImageUrl),
                    backgroundColor: Colors.grey[200],
                  ),
                  if (isVerified)
                    Positioned(
                      bottom: -2,
                      right: -2,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: const BoxDecoration(
                          color: Color(
                            0xFF3E2723,
                          ), // Dark brown badge background
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.check,
                          color: Colors.white,
                          size: 10,
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  userName,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ),
              Text(
                timeAgo,
                style: TextStyle(fontSize: 12, color: Colors.grey.shade500),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Text(
            reviewText,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              Row(
                children: List.generate(
                  5,
                  (index) => Icon(
                    index < rating.floor()
                        ? Icons.star_rounded
                        : Icons.star_outline_rounded,
                    color: Colors.amber,
                    size: 20,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Text(
                rating.toStringAsFixed(1),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
