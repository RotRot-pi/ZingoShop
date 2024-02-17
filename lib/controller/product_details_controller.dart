import 'package:ecommercecourse/controller/cart_controller.dart';
import 'package:ecommercecourse/data/model/cart_item.dart';
import 'package:ecommercecourse/data/model/items.dart';
import 'package:get/get.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImpl extends ProductDetailsController {
  CartControllerImpl cartController = Get.put(CartControllerImpl());
  late Item item;

  intialData() async {
    item = Get.arguments['item'];
    await cartController.getData();
    List<CartItem> cartItems = [...cartController.cart];
    for (var cartItem in cartItems) {
      if (cartItem.itemsId == item.itemsId) {
        cartController.cartProductCount = cartItem.cartItemCount;
        print("COUNT: ${cartController.cartProductCount}");
      }
    }
  }

  List subitems = [
    {"name": "red", "id": 1, "active": '0'},
    {"name": "yallow", "id": 2, "active": '0'},
    {"name": "black", "id": 3, "active": '1'}
  ];

  @override
  void onInit() {
    intialData();
    super.onInit();
  }
}
