import 'package:ecommercecourse/core/constants/colors.dart';
import 'package:ecommercecourse/core/constants/image_assets.dart';
import 'package:flutter/material.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final onAdd;
  final onRemove;
  final imageName;
  const CustomItemsCartList({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    this.onAdd,
    this.onRemove,
    this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Expanded(
            flex: 2,
            child: Image.asset(
              imageName,
              height: 90,
              fit: BoxFit.cover,
            )),
        Expanded(
            flex: 3,
            child: ListTile(
              title: Text(name, style: TextStyle(fontSize: 15)),
              subtitle: Text(price,
                  style: const TextStyle(
                      color: AppColors.primaryColor, fontSize: 17)),
            )),
        Expanded(
            child: Column(
          children: [
            Container(
                height: 35,
                child: IconButton(onPressed: onAdd, icon: Icon(Icons.add))),
            Container(
                height: 30,
                child: Text(
                  count,
                  style: TextStyle(fontFamily: "sans"),
                )),
            Container(
                height: 25,
                child:
                    IconButton(onPressed: onRemove, icon: Icon(Icons.remove)))
          ],
        ))
      ]),
    );
  }
}
