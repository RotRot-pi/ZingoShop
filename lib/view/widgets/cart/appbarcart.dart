import 'package:flutter/material.dart';

class TopAppbarCart extends StatelessWidget {
  final String title;
  const TopAppbarCart({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            Expanded(
                child: Container(
              alignment: Alignment.centerLeft,
              child: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
            )),
            Expanded(
                child: Container(
              alignment: Alignment.center,
              child: Text(
                title,
                style: TextStyle(fontSize: 25),
              ),
            )),
            Spacer()
          ],
        ));
  }
}
