import 'package:flutter/material.dart';

class TrackLiveLocationView extends StatelessWidget {
  const TrackLiveLocationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          //  Map Canvas Layer (Offline-safe mock map grid)
          Positioned.fill(
            child: Container(
              color: const Color(0xFFF2F2F0),
              child: Stack(
                children: [
                  // Simulated map background grid & roads
                  Positioned.fill(
                    child: CustomPaint(painter: _MapGridBackgroundPainter()),
                  ),

                  Positioned.fill(
                    child: CustomPaint(painter: _RoutePathPainter()),
                  ),

                  const Positioned(
                    top: 220,
                    left: 110,
                    child: _MapPin(icon: Icons.store_mall_directory_rounded),
                  ),

                  Positioned(
                    top: 320,
                    left: 140,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE5A66B),
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [
                          BoxShadow(color: Colors.black26, blurRadius: 4),
                        ],
                      ),
                      child: const Icon(
                        Icons.local_shipping_rounded,
                        color: Colors.white,
                        size: 18,
                      ),
                    ),
                  ),

                  const Positioned(
                    top: 360,
                    left: 150,
                    child: _MapPin(icon: Icons.checkroom_rounded),
                  ),
                ],
              ),
            ),
          ),

          Positioned(
            top: 70,
            left: 20,
            right: 20,
            child: Row(
              children: [
                InkWell(
                  onTap: () => Navigator.maybePop(context),
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 6),
                      ],
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      size: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
                const Expanded(
                  child: Text(
                    'Track Live Location',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ),
                const SizedBox(width: 40),
              ],
            ),
          ),

          Positioned(
            right: 20,
            bottom: MediaQuery.of(context).size.height * 0.44,
            child: FloatingActionButton.small(
              onPressed: () {},
              elevation: 2,
              backgroundColor: Colors.white,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.my_location_rounded,
                color: Color(0xFF3E2723),
              ),
            ),
          ),

          DraggableScrollableSheet(
            initialChildSize: 0.42,
            minChildSize: 0.35,
            maxChildSize: 0.85,
            builder: (context, scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                ),
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(20),
                  children: [
                    // Sheet Drag Handle
                    Center(
                      child: Container(
                        width: 40,
                        height: 4,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Estimated Arrival Time Header
                    Center(
                      child: Column(
                        children: [
                          Text(
                            'Estimated Arrival Time',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey.shade500,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            '02:45 PM - 03:15 PM',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Divider(color: Colors.grey.shade200),
                    const SizedBox(height: 12),

                    // Driver Details Row
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 24,
                          backgroundColor: Color(0xFFFAF2EB),
                          child: Icon(Icons.person, color: Color(0xFF3E2723)),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Omar Speirs',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Delivery Man',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Safe Action Buttons
                        _CircularIconButton(
                          icon: Icons.chat_bubble_outline_rounded,
                          onTap: () {},
                        ),
                        const SizedBox(width: 8),
                        _CircularIconButton(
                          icon: Icons.phone_outlined,
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.radio_button_checked_rounded,
                                color: Color(0xFF3E2723),
                                size: 20,
                              ),
                              SizedBox(width: 12),
                              Text(
                                'Fashion Store Warehouse',
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 9),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Container(
                                height: 20,
                                width: 2,
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: Colors.amber.shade700,
                                size: 20,
                              ),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  '245 Madison Ave, New York, NY...',
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),

                    const Text(
                      'Order Details',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFAF2EB),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.checkroom_rounded,
                              color: Color(0xFF3E2723),
                            ),
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'Modern Party Dress',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Custom Pin Marker Shape
class _MapPin extends StatelessWidget {
  final IconData icon;

  const _MapPin({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color(0xFF3E2723),
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
          ),
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: const BoxDecoration(
              color: Color(0xFFE5A66B),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 16, color: Colors.black),
          ),
        ),
      ],
    );
  }
}

/// Safe Circular Icon Button Helper
class _CircularIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircularIconButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          color: Color(0xFFFAF2EB),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 18, color: const Color(0xFF3E2723)),
      ),
    );
  }
}

/// Custom Canvas Painter to render map grid & road lines (no network requests required)
class _MapGridBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final roadPaint = Paint()
      ..color = Colors.white.withOpacity(0.85)
      ..strokeWidth = 14
      ..style = PaintingStyle.stroke;

    final thinRoadPaint = Paint()
      ..color = Colors.white.withOpacity(0.6)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    // Draw main grid roads
    canvas.drawLine(
      Offset(0, size.height * 0.25),
      Offset(size.width, size.height * 0.1),
      roadPaint,
    );
    canvas.drawLine(
      Offset(0, size.height * 0.45),
      Offset(size.width, size.height * 0.3),
      roadPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.2, 0),
      Offset(size.width * 0.7, size.height),
      roadPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.6, 0),
      Offset(size.width * 0.95, size.height),
      roadPaint,
    );

    // Draw secondary streets
    canvas.drawLine(
      Offset(0, size.height * 0.35),
      Offset(size.width, size.height * 0.22),
      thinRoadPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.4, 0),
      Offset(size.width * 0.1, size.height),
      thinRoadPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Painter for drawing the route polyline path
class _RoutePathPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF3E2723)
      ..strokeWidth = 4.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final path = Path();
    path.moveTo(125, 235);
    path.lineTo(95, 305);
    path.lineTo(155, 335);
    path.lineTo(165, 375);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
