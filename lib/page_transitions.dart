import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPageTransitionLeftAndRight extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve? curve,
      Alignment? alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    // Get the current language
    final locale = Get.locale;
    final isRTL = locale?.languageCode == 'ar';

    // Create a slide transition based on the language direction
    return SlideTransition(
      position: Tween<Offset>(
        begin: Offset(isRTL ? -1.0 : 1.0, 0.0),
        end: Offset.zero,
      ).animate(
          CurvedAnimation(parent: animation, curve: curve ?? Curves.easeInOut)),
      child: child,
    );
  }
}

class FadeInPageTransition extends CustomTransition {
  @override
  Widget buildTransition(
      BuildContext context,
      Curve? curve,
      Alignment? alignment,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child) {
    return FadeTransition(
      opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: animation, curve: curve ?? Curves.easeInOut),
      ),
      child: child,
    );
  }
}
