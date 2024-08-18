import 'package:zingoshop/core/constants/colors.dart';
import 'package:zingoshop/core/constants/spaces.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceAndCountItems extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemove;
  final String price;
  final String count;
  const PriceAndCountItems(
      {super.key,
      required this.onAdd,
      required this.onRemove,
      required this.price,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          color: AppColors.white,
          child: Padding(
            padding: AppSpacing.addEdgeInsetsAll(p4),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                    onTap: onAdd,
                    child: const Icon(
                      Icons.add,
                      size: s20,
                    )),
                // AppSpacing.addWidth(h12),
                Container(
                    alignment: Alignment.center,
                    padding: AppSpacing.addEdgeInsetsOnly(bottom: h2),
                    width: w56,
                    // decoration:
                    //     BoxDecoration(border: Border.all(color: AppColors.black)),
                    child: Text(
                      count,
                      style: TextStyle(fontSize: s16.sp, height: 1.1.h),
                    )),
                // AppSpacing.addWidth(w4),
                InkWell(
                    onTap: onRemove,
                    child: const Icon(
                      Icons.remove,
                      size: s20,
                    )),
              ],
            ),
          ),
        ),
        AppSpacing.addHeigh(h12),
        Text(
          "$price \$",
          style: TextStyle(
            color: AppColors.black,
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
