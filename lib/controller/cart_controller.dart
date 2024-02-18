import 'package:ecommercecourse/core/classes/request_status.dart';
import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:ecommercecourse/core/functions/handing_data.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/cart_item_data.dart';
import 'package:ecommercecourse/data/model/cart_item.dart';
import 'package:get/get.dart';

abstract class CartController extends GetxController {
  getData();
  addToCart(var itemId, int cartProductCount);
  removeFromCart(var itemId);
  updateCart(var itemId, int cartProductCount);
  addProductCount();
  reduceProductCount();
}

class CartControllerImpl extends CartController {
  final CartItemData cartItemData = CartItemData(crud: Get.find());
  final AppServices _appServices = Get.find();
  RequestStatus requestStatus = RequestStatus.notInitialized;
  List cartItems = [];
  var cartTotalPrice = 0;
  double price = 0;
  int cartProductCount = 0;
  @override
  getData() async {
    print(
        '===================================================================');
    print("GETTING CART IS INIT AND READY");
    print(
        '===================================================================');
    cartItems.clear();

    final userId = _appServices.sharedPreferences.getInt("id");

    requestStatus = RequestStatus.loading;
    var response = await cartItemData.getData(userId);
    requestStatus = handelingData(response);
    if (requestStatus == RequestStatus.success) {
      if (response['status'] == 'success') {
        for (var element in response) {
          cartItems.add(CartItem.fromMap(element));
        }
        cartTotalPrice = response['cartTotalPrice']['cart_total_price'];
      }
    } else {
      requestStatus = RequestStatus.failure;
    }
    update();
  }

  @override
  addToCart(var itemId, int cartProductCount) async {
    final userId = _appServices.sharedPreferences.getInt("id");
    var response =
        await cartItemData.addToCart(userId, itemId, cartProductCount);
    if (response['status'] == 'success') {
      for (var element in response) {
        cartItems.add(CartItem.fromMap(element));
      }
      cartTotalPrice = response['cartTotalPrice']['cart_total_price'];
      //getData();
      //Navigate to cart or to checkout or to home
      //Get.toNamed(AppRoutes.cart);
    }
    update();
  }

  @override
  removeFromCart(var itemId) async {
    final userId = _appServices.sharedPreferences.getInt("id");
    var response = await cartItemData.removeFromCart(userId, itemId);
    if (response['status'] == 'success') {
      getData();
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  addProductCount() {
    cartProductCount++;
    update();
  }

  @override
  reduceProductCount() {
    if (cartProductCount > 0) {
      cartProductCount--;
    }
    update();
  }

  @override
  updateCart(itemId, int cartProductCount) {
    // TODO: implement updateCart
    throw UnimplementedError();
  }
}
