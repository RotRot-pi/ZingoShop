import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/constants/api_link.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:ecommercecourse/core/functions/translate_data.dart';
import 'package:ecommercecourse/data/model/categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImpl> {
  const ListCategoriesHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h80,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => AppSpacing.addWidth(w12),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return CategoyWidget(
              categoryIndex: index, category: controller.categories[index]);
        },
      ),
    );
  }
}

class CategoyWidget extends GetView<HomeControllerImpl> {
  const CategoyWidget({
    required this.categoryIndex,
    super.key,
    required this.category,
  });
  final int categoryIndex;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.goToItems(
          controller.categories, categoryIndex, category.categoriesId),
      child: Container(
        width: w64,
        margin: EdgeInsets.only(right: p8),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(p8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
              ),
              child: SvgPicture.network(
                "${ApiLink.categoriesImageFolder}${category.categoriesImage}",
                fit: BoxFit.fitHeight,
                height: h32,
              ),
            ),
            AppSpacing.addHeigh(h8),
            SizedBox(
              // width: w80,
              child: Text(
                  translateData(
                      category.categoriesNameAr, category.categoriesName),
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: s8,
                      overflow: TextOverflow.fade,
                      fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
