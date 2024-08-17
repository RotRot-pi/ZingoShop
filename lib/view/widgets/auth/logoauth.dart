import 'package:zingoshop/core/constants/image_assets.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:flutter/material.dart';

class LogoAuth extends StatefulWidget {
  const LogoAuth({super.key});

  @override
  State<LogoAuth> createState() => _LogoAuthState();
}

class _LogoAuthState extends State<LogoAuth> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _fadeInController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
    _fadeInController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _fadeInController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, -1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _animationController,
          curve: Curves.easeOut,
        ),
      ),
      child: FadeTransition(
        opacity: Tween<double>(
          begin: 0,
          end: 1,
        ).animate(
          CurvedAnimation(
            parent: _fadeInController,
            curve: Curves.easeOut,
          ),
        ),
        child: SizedBox(
          height: h128,
          child: Image.asset(
            AppImageAssets.logo,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
