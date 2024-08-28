// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CartModel {
  int? itemsId;
  String itemsName = '';
  String itemsNameAr = '';
  double? itemsPrice;
  int? itemsDiscount;
  int? itemsActive;
  int? itemsCount;
  String itemsImage = '';
  String itemsDescription = '';
  String itemsDescriptionAr = '';
  String itemsDatetime = '';
  int? itemsCategory;
  int? cartItemCount;
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;
  double? totalPrice;

  CartModel({
    int? itemsId,
    String? itemsName,
    String? itemsNameAr,
    double? itemsPrice,
    int? itemsDiscount,
    int? itemsActive,
    int? itemsCount,
    String? itemsImage,
    String? itemsDescription,
    String? itemsDescriptionAr,
    String? itemsDatetime,
    int? itemsCategory,
    int? cartItemCount,
    int? cartId,
    int? cartUsersid,
    int? cartItemsid,
    double? totalPrice,
  }) {
    this.itemsId = itemsId ?? 0;
    this.itemsName = itemsName ?? '';
    this.itemsNameAr = itemsNameAr ?? '';
    this.itemsPrice = itemsPrice ?? 0.0;
    this.itemsDiscount = itemsDiscount ?? 0;
    this.itemsActive = itemsActive ?? 0;
    this.itemsCount = itemsCount ?? 0;
    this.itemsImage = itemsImage ?? '';
    this.itemsDescription = itemsDescription ?? '';
    this.itemsDescriptionAr = itemsDescriptionAr ?? '';
    this.itemsDatetime = itemsDatetime ?? '';
    this.itemsCategory = itemsCategory ?? 0;
    this.cartItemCount = cartItemCount ?? 0;
    this.cartId = cartId ?? 0;
    this.cartUsersid = cartUsersid ?? 0;
    this.cartItemsid = cartItemsid ?? 0;
    this.totalPrice = totalPrice ?? 0.0;
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items_id': itemsId,
      'items_name': itemsName,
      'items_name_ar': itemsNameAr,
      'items_price': itemsPrice,
      'items_discount': itemsDiscount,
      'items_active': itemsActive,
      'items_count': itemsCount,
      'items_image': itemsImage,
      'items_description': itemsDescription,
      'items_description_ar': itemsDescriptionAr,
      'items_datetime': itemsDatetime,
      'items_category': itemsCategory,
      'cart_item_count': cartItemCount,
      'cart_id': cartId,
      'cart_user_id': cartUsersid,
      'cart_item_id': cartItemsid,
      'total_price': totalPrice,
    };
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      itemsId: map['items_id'] as int?,
      itemsName: map['items_name'] as String?,
      itemsNameAr: map['items_name_ar'] as String?,
      itemsPrice: map['items_price']?.toDouble(),
      itemsDiscount: map['items_discount'] as int?,
      itemsActive: map['items_active'] as int?,
      itemsCount: map['items_count'] as int?,
      itemsImage: map['items_image'] as String?,
      itemsDescription: map['items_description'] as String?,
      itemsDescriptionAr: map['items_description_ar'] as String?,
      itemsDatetime: map['items_datetime'] as String?,
      itemsCategory: map['items_category'] as int?,
      cartItemCount: map['cart_item_count'] as int?,
      cartId: map['cart_id'] as int?,
      cartUsersid: map['cart_user_id'] as int?,
      cartItemsid: map['cart_items_id'] as int?,
      totalPrice: map['total_price']?.toDouble(),
    );
  }
  String toJson() => json.encode(toMap());

  factory CartModel.fromJson(String source) =>
      CartModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CartModel(itemsId: $itemsId, itemsName: $itemsName, itemsNameAr: $itemsNameAr, itemsPrice: $itemsPrice, itemsDiscount: $itemsDiscount, itemsActive: $itemsActive, itemsCount: $itemsCount, itemsImage: $itemsImage, itemsDescription: $itemsDescription, itemsDescriptionAr: $itemsDescriptionAr, itemsDatetime: $itemsDatetime, itemsCategory: $itemsCategory, cartItemCount: $cartItemCount, cartId: $cartId, cartUsersid: $cartUsersid, cartItemsid: $cartItemsid, )';
  }

  @override
  bool operator ==(covariant CartModel other) {
    if (identical(this, other)) return true;

    return other.itemsId == itemsId &&
        other.itemsName == itemsName &&
        other.itemsNameAr == itemsNameAr &&
        other.itemsPrice == itemsPrice &&
        other.itemsDiscount == itemsDiscount &&
        other.itemsActive == itemsActive &&
        other.itemsCount == itemsCount &&
        other.itemsImage == itemsImage &&
        other.itemsDescription == itemsDescription &&
        other.itemsDescriptionAr == itemsDescriptionAr &&
        other.itemsDatetime == itemsDatetime &&
        other.itemsCategory == itemsCategory &&
        other.cartItemCount == cartItemCount &&
        other.cartId == cartId &&
        other.cartUsersid == cartUsersid &&
        other.cartItemsid == cartItemsid &&
        other.totalPrice == totalPrice;
  }

  @override
  int get hashCode {
    return itemsId.hashCode ^
        itemsName.hashCode ^
        itemsNameAr.hashCode ^
        itemsPrice.hashCode ^
        itemsDiscount.hashCode ^
        itemsActive.hashCode ^
        itemsCount.hashCode ^
        itemsImage.hashCode ^
        itemsDescription.hashCode ^
        itemsDescriptionAr.hashCode ^
        itemsDatetime.hashCode ^
        itemsCategory.hashCode ^
        cartItemCount.hashCode ^
        cartId.hashCode ^
        cartUsersid.hashCode ^
        cartItemsid.hashCode ^
        totalPrice.hashCode;
  }
}
