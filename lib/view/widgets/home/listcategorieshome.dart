import 'package:ecommercecourse/controller/home_controller.dart';
import 'package:ecommercecourse/core/constants/api_link.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
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
      height: h100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => AppSpacing.addWidth(w16),
        itemCount: controller.categories.length,
        itemBuilder: (context, index) {
          return CategoyWidget(category: controller.categories[index]);
        },
      ),
    );
  }
}

class CategoyWidget extends StatelessWidget {
  const CategoyWidget({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: p8),
      child: Column(
        children: [
          Container(
            width: w56,
            height: h56,
            padding: EdgeInsets.all(p8),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(r12)),
            child: SvgPicture.network(
              "${ApiLink.categoriesImageFolder}${category.categoriesImage}",
            ),
          ),
          AppSpacing.addHeigh(h8),
          Text(category.categoriesName,
              style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: s12,
                  fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
