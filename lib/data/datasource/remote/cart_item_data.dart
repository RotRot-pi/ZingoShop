import 'package:ecommercecourse/core/classes/crud.dart';
import 'package:ecommercecourse/core/constants/api_link.dart';

class CartItemData {
  Crud crud;
  CartItemData({
    required this.crud,
  });

  getData(var userId) async {
    var response = await crud.post(ApiLink.cartView, {
      'user_id': userId.toString(),
    });
    print("CartItemData");
    return response.fold((l) => l, (r) => r);
  }

  addToCart(var userId, var itemId, var cartProductCount) async {
    var response = await crud.post(ApiLink.addCart, {
      'user_id': userId.toString(),
      'item_id': itemId.toString(),
      'item_count': cartProductCount.toString(),
    });
    print("CartItemData");
    return response.fold((l) => l, (r) => r);
  }

  removeFromCart(var userId, var itemId) async {
    var response = await crud.post(ApiLink.removeFromCart, {
      'user_id': userId.toString(),
      'item_id': itemId.toString(),
    });
    print("CartItemData");
    return response.fold((l) => l, (r) => r);
  }
}
