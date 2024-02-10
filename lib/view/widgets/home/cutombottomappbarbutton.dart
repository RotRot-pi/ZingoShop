import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBarButton extends StatelessWidget {
  final String name;
  final IconData icon;
  final void Function()? onPressed;
  final bool isActive;
  const CustomBottomAppBarButton({
    super.key,
    required this.name,
    required this.icon,
    required this.onPressed,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        shape: const CircleBorder(),
        padding: AppSpacing.addEdgeInsetsOnly(top: zero, bottom: zero),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            isActive
                ? Icon(icon, color: Theme.of(context).primaryColor)
                : Icon(icon),
            Text(
              name,
              textAlign: TextAlign.center,
              style: isActive
                  ? Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold)
                  : Theme.of(context).textTheme.bodySmall,
            )
          ],
        ));
  }
}
