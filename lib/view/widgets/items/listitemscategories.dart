import 'package:zingoshop/controller/items_controller.dart';
import 'package:zingoshop/core/constants/colors.dart';

import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/core/functions/translate_data.dart';
import 'package:zingoshop/data/model/categories.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ListItemsCategories extends GetView<ItemsControllerImpl> {
  const ListItemsCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h56,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => AppSpacing.addWidth(w16),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return CategoyWidget(
              categoryIndex: index, category: controller.categories[index]);
        },
      ),
    );
  }
}

class CategoyWidget extends GetView<ItemsControllerImpl> {
  const CategoyWidget({
    required this.categoryIndex,
    super.key,
    required this.category,
  });
  final int categoryIndex;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImpl>(builder: (context) {
      return GestureDetector(
        onTap: () =>
            controller.changeCategory(categoryIndex, category.categoriesId),
        child: Container(
          margin: EdgeInsets.only(right: p8),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border(
                        bottom: controller.categoryIndex == categoryIndex
                            ? BorderSide(
                                color: AppColors.secondaryColor, width: w2)
                            : BorderSide.none)),
                child: Text(
                    translateData(
                        category.categoriesNameAr, category.categoriesName),
                    style: const TextStyle(
                        color: AppColors.secondaryGrey,
                        fontSize: s16,
                        fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      );
    });
  }
}
