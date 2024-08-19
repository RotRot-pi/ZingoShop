import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:zingoshop/core/constants/colors.dart';

class AnimatedBackground extends StatefulWidget {
  final double height;

  const AnimatedBackground({Key? key, required this.height}) : super(key: key);

  @override
  _AnimatedBackgroundState createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          height: widget.height,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                // Color(0xFF6A11CB),
                // Color(0xFF2575FC),
                AppColors.primaryColor,
                AppColors.fifthColor
              ],
            ),
          ),
          child: CustomPaint(
            painter: BackgroundPainter(_controller.value),
            child: child,
          ),
        );
      },
    );
  }
}

class BackgroundPainter extends CustomPainter {
  final double animationValue;

  BackgroundPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.white.withOpacity(0.1);

    // Draw animated circles
    _drawAnimatedCircle(canvas, size, paint, 0.2, 0.3);
    _drawAnimatedCircle(canvas, size, paint, 0.5, 0.7);
    _drawAnimatedCircle(canvas, size, paint, 0.8, 0.5);

    // Draw animated lines
    _drawAnimatedLine(canvas, size, paint, 0.1, 0.9);
    _drawAnimatedLine(canvas, size, paint, 0.3, 0.7);
    _drawAnimatedLine(canvas, size, paint, 0.6, 0.4);
  }

  void _drawAnimatedCircle(
      Canvas canvas, Size size, Paint paint, double xFactor, double yFactor) {
    final center = Offset(
      size.width * xFactor + math.sin(animationValue * 2 * math.pi) * 20,
      size.height * yFactor + math.cos(animationValue * 2 * math.pi) * 20,
    );
    canvas.drawCircle(
        center, 30 + 10 * math.sin(animationValue * 2 * math.pi), paint);
  }

  void _drawAnimatedLine(Canvas canvas, Size size, Paint paint,
      double startFactor, double endFactor) {
    final start = Offset(
      size.width * startFactor,
      size.height *
          (startFactor + 0.1 * math.sin(animationValue * 2 * math.pi)),
    );
    final end = Offset(
      size.width * endFactor,
      size.height * (endFactor + 0.1 * math.cos(animationValue * 2 * math.pi)),
    );
    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
