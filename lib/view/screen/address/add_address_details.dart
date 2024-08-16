import 'package:zingoshop/core/constants/spaces.dart';
import 'package:zingoshop/view/widgets/cart/buttoncart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/address/add_address_details.dart';
import '../../widgets/auth/customtextformauth.dart';

class AddAddressDetailsScreen extends StatelessWidget {
  const AddAddressDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AddAddressDetailsControllerImpl());
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddAddressDetailsScreen'),
      ),
      body: Padding(
        padding: AppSpacing.addEdgeInsetsAll(p12),
        child: Column(
          children: [
            AppSpacing.addHeigh(h24),
            CustonTextFormAuth(
              hinttext: 'city',
              controller: controller.cityController,
              labeltext: 'City',
              iconData: Icons.location_city,
              validator: (val) {
                return null;
              },
            ),
            CustonTextFormAuth(
              hinttext: 'street',
              controller: controller.streetController,
              labeltext: 'Street',
              iconData: Icons.streetview,
              validator: (val) {
                return null;
              },
            ),
            CustonTextFormAuth(
              hinttext: 'name',
              controller: controller.nameController,
              labeltext: 'Name',
              iconData: Icons.navigation,
              validator: (val) {
                return null;
              },
            ),
            CustomButtonCart(
                onPressed: () => controller.addAddress(), textbutton: 'Add'),
          ],
        ),
      ),
    );
  }
}
