import 'package:ecommercecourse/core/classes/crud.dart';
import 'package:ecommercecourse/core/constants/api_link.dart';

class CartData {
  Crud crud;
  CartData(this.crud);
  addCart(var usersid, var itemsid, int? count) async {
    var response = await crud.post(ApiLink.addCart, {
      "user_id": usersid.toString(),
      "item_id": itemsid.toString(),
      "item_count": count.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  deleteCart(var usersid, var itemsid, int? count) async {
    var response = await crud.post(ApiLink.deleteCart, {
      "user_id": usersid.toString(),
      "item_id": itemsid.toString(),
      "item_count": count.toString()
    });
    return response.fold((l) => l, (r) => r);
  }

  getCountCart(var usersid, var itemsid) async {
    var response = await crud.post(ApiLink.getCountCart,
        {"user_id": usersid.toString(), "item_id": itemsid.toString()});
    return response.fold((l) => l, (r) => r);
  }

  viewCart(var usersid) async {
    var response = await crud.post(ApiLink.cartView, {
      "user_id": usersid.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }

  checkCoupon(var couponName) async {
    var response = await crud.post(ApiLink.checkCoupon, {
      "coupon_name": couponName.toString(),
    });
    return response.fold((l) => l, (r) => r);
  }
}
