import 'dart:math' as math;
import 'package:flutter/material.dart';

class WaveWidget extends StatefulWidget {
  final Size size;
  final double yOffset;
  final Color color;

  const WaveWidget({
    super.key,
    required this.size,
    required this.yOffset,
    required this.color,
  });

  @override
  State<StatefulWidget> createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget> with TickerProviderStateMixin {
  late AnimationController waveAnimationController;
  late AnimationController transitoinAnimationController;
  List<Offset> wavePoints = [];
  late Animation<Offset> translateAnimation;
  @override
  void initState() {
    super.initState();

    waveAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000))
      ..addListener(() {
        wavePoints.clear();

        final double waveSpeed = waveAnimationController.value * 1080;
        final double fullSphere = waveAnimationController.value * math.pi * 2;
        final double normalizer = math.cos(fullSphere);
        const double waveWidth = math.pi / 270;
        const double waveHeight = 20.0;

        for (int i = 0; i <= widget.size.width.toInt(); ++i) {
          double calc = math.sin((waveSpeed - i) * waveWidth);
          wavePoints.add(
            Offset(
              i.toDouble(), //X
              calc * waveHeight * normalizer + widget.yOffset, //Y
            ),
          );
        }
      });
    waveAnimationController.repeat();
    transitoinAnimationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2500))
      ..forward();

    translateAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
        parent: transitoinAnimationController, curve: Curves.ease));
  }

  @override
  void dispose() {
    waveAnimationController.dispose();
    transitoinAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: waveAnimationController,
      builder: (context, _) {
        return SlideTransition(
          position: translateAnimation,
          child: ClipPath(
            clipper: ClipperWidget(
              waveList: wavePoints,
            ),
            child: Container(
              width: widget.size.width,
              height: widget.size.height,
              color: widget.color,
            ),
          ),
        );
      },
    );
  }
}

class ClipperWidget extends CustomClipper<Path> {
  final List<Offset> waveList;
  ClipperWidget({required this.waveList});

  @override
  getClip(Size size) {
    final Path path = Path();
    path.addPolygon(waveList, false);
    path.lineTo(size.width, size.height);
    path.lineTo(0.0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) => true;
}
