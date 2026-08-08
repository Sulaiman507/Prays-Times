import 'dart:math';
import 'package:flutter/material.dart';
import '../utils/app_constants.dart';

class AnimatedBackground extends StatefulWidget {
  final bool isDark;
  final Widget child;

  const AnimatedBackground({
    super.key,
    required this.isDark,
    required this.child,
  });

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    )..repeat(reverse: true);
    _controller3 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: widget.isDark
                  ? [
                      const Color(0xFF0D1117),
                      const Color(0xFF161B22),
                      const Color(0xFF0D1117),
                    ]
                  : [
                      const Color(0xFFF0F4F0),
                      const Color(0xFFE8F0E8),
                      const Color(0xFFF0F4F0),
                    ],
            ),
          ),
        ),
        // Animated circles
        AnimatedBuilder(
          animation: _controller1,
          builder: (context, child) {
            return Positioned(
              top: -100 + _controller1.value * 200,
              right: -50 + _controller1.value * 100,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppConstants.primaryGreen.withOpacity(widget.isDark ? 0.08 : 0.06),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _controller2,
          builder: (context, child) {
            return Positioned(
              bottom: -80 + _controller2.value * 160,
              left: -60 + _controller2.value * 120,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppConstants.gold.withOpacity(widget.isDark ? 0.06 : 0.08),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        AnimatedBuilder(
          animation: _controller3,
          builder: (context, child) {
            return Positioned(
              top: MediaQuery.of(context).size.height * 0.4,
              left: -40 + _controller3.value * 80,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      AppConstants.secondaryGreen.withOpacity(widget.isDark ? 0.05 : 0.04),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        // Islamic geometric pattern overlay
        Positioned.fill(
          child: CustomPaint(
            painter: _IslamicPatternPainter(
              color: widget.isDark
                  ? Colors.white.withOpacity(0.02)
                  : AppConstants.primaryGreen.withOpacity(0.03),
            ),
          ),
        ),
        widget.child,
      ],
    );
  }
}

class _IslamicPatternPainter extends CustomPainter {
  final Color color;

  _IslamicPatternPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    const spacing = 40.0;
    for (double x = 0; x < size.width; x += spacing) {
      for (double y = 0; y < size.height; y += spacing) {
        // Draw 8-pointed star pattern
        final center = Offset(x + spacing / 2, y + spacing / 2);
        final radius = spacing / 3;

        for (int i = 0; i < 8; i++) {
          final angle = (i * pi / 4);
          final x1 = center.dx + radius * cos(angle);
          final y1 = center.dy + radius * sin(angle);
          final x2 = center.dx + radius * cos(angle + pi / 4);
          final y2 = center.dy + radius * sin(angle + pi / 4);
          canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
