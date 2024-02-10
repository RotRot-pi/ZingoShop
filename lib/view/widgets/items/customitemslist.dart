import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommercecourse/core/constants/api_link.dart';
import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:ecommercecourse/core/constants/spaces.dart';
import 'package:ecommercecourse/core/functions/translate_data.dart';

import 'package:ecommercecourse/data/model/items.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomListItems extends StatelessWidget {
  final Item item;
  const CustomListItems({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        child: Card(
      child: Padding(
        padding: AppSpacing.addEdgeInsetsAll(p12),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CachedNetworkImage(
                imageUrl: "${ApiLink.itemsImageFolder}/${item.itemsImage}",
                height: h100,
                fit: BoxFit.fill,
                fadeInDuration: const Duration(milliseconds: 400),
                fadeOutDuration: const Duration(milliseconds: 400),
              ),
              AppSpacing.addHeigh(h10),
              Text(translateData(item.itemsNameAr, item.itemsName),
                  style: const TextStyle(
                      color: AppColors.black,
                      fontSize: s16,
                      fontWeight: FontWeight.bold)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${"rating".tr} 3.5", textAlign: TextAlign.center),
                  Container(
                    alignment: Alignment.bottomCenter,
                    height: h24,
                    child: Row(
                      children: [
                        ...List.generate(
                            5,
                            (index) => const Icon(
                                  Icons.star,
                                  size: s16,
                                ))
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${item.itemsPrice} \$",
                      style: const TextStyle(
                          color: AppColors.primaryColor,
                          fontSize: s16,
                          fontWeight: FontWeight.bold,
                          fontFamily: "sans")),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite,
                        color: AppColors.primaryColor,
                      ))
                ],
              )
            ]),
      ),
    ));
  }
}
