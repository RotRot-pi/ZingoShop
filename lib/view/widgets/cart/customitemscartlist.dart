import 'package:cached_network_image/cached_network_image.dart';
import 'package:zingoshop/core/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:zingoshop/core/constants/spaces.dart';

class CustomItemsCartList extends StatefulWidget {
  final String name;
  final String price;
  final String count;
  final String imageName;
  final Function(int) onCountChanged;
  const CustomItemsCartList({
    super.key,
    required this.name,
    required this.price,
    required this.count,
    required this.imageName,
    required this.onCountChanged,
  });

  @override
  State<CustomItemsCartList> createState() => _CustomItemsCartListState();
}

class _CustomItemsCartListState extends State<CustomItemsCartList> {
  late int itemCount;

  @override
  void initState() {
    super.initState();
    itemCount = int.parse(widget.count);
  }

  void _incrementCount() {
    setState(() {
      itemCount++;
    });
    widget.onCountChanged(itemCount);
  }

  void _decrementCount() {
    if (itemCount > 0) {
      setState(() {
        itemCount--;
      });
      widget.onCountChanged(itemCount);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(r20),
      ),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
            flex: 2,
            child: SizedBox(
              height: h80,
              child: CachedNetworkImage(
                imageUrl: widget.imageName,
                fit: BoxFit.scaleDown,
              ),
            )),
        Expanded(
            flex: 3,
            child: ListTile(
              title: Text(
                widget.name,
                style: const TextStyle(fontSize: 15),
                textAlign: TextAlign.start,
              ),
              subtitle: Text(widget.price,
                  style: const TextStyle(
                      color: AppColors.primaryColor, fontSize: 17)),
            )),
        Expanded(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
                height: 35,
                child: IconButton(
                    onPressed: _incrementCount, icon: const Icon(Icons.add))),
            Container(
                alignment: Alignment.center,
                height: 30,
                child: Text(
                  "$itemCount",
                  style: const TextStyle(fontFamily: "OpenSans"),
                  textAlign: TextAlign.center,
                )),
            SizedBox(
                height: 25,
                child: IconButton(
                    onPressed: _decrementCount, icon: const Icon(Icons.remove)))
          ],
        ))
      ]),
    );
  }
}
