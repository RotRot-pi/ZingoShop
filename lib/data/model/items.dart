// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// class ItemsModel {
//   List<Item> items;

//   ItemsModel({
//     required this.items,
//   });
// }

class Item {
  int itemsId;
  String itemsName;
  String itemsNameAr;
  int itemsPrice;
  int itemsDiscount;
  int itemsActive;
  int itemsCount;
  String itemsImage;
  String itemsDescription;
  String itemsDescriptionAr;
  String itemsDatetime;
  int itemsCategory;
  int? favorite;

  Item(
      {required this.itemsId,
      required this.itemsName,
      required this.itemsNameAr,
      required this.itemsPrice,
      required this.itemsDiscount,
      required this.itemsActive,
      required this.itemsCount,
      required this.itemsImage,
      required this.itemsDescription,
      required this.itemsDescriptionAr,
      required this.itemsDatetime,
      required this.itemsCategory,
      this.favorite});

  Item copyWith({
    int? itemsId,
    String? itemsName,
    String? itemsNameAr,
    int? itemsPrice,
    int? itemsDiscount,
    int? itemsActive,
    int? itemsCount,
    String? itemsImage,
    String? itemsDescription,
    String? itemsDescriptionAr,
    String? itemsDatetime,
    int? itemsCategory,
    int? favorite,
  }) {
    return Item(
        itemsId: itemsId ?? this.itemsId,
        itemsName: itemsName ?? this.itemsName,
        itemsNameAr: itemsNameAr ?? this.itemsNameAr,
        itemsPrice: itemsPrice ?? this.itemsPrice,
        itemsDiscount: itemsDiscount ?? this.itemsDiscount,
        itemsActive: itemsActive ?? this.itemsActive,
        itemsCount: itemsCount ?? this.itemsCount,
        itemsImage: itemsImage ?? this.itemsImage,
        itemsDescription: itemsDescription ?? this.itemsDescription,
        itemsDescriptionAr: itemsDescriptionAr ?? this.itemsDescriptionAr,
        itemsDatetime: itemsDatetime ?? this.itemsDatetime,
        itemsCategory: itemsCategory ?? this.itemsCategory,
        favorite: favorite ?? this.favorite);
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
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      itemsId: map['items_id'] as int,
      itemsName: map['items_name'] as String,
      itemsNameAr: map['items_name_ar'] as String,
      itemsPrice: map['items_price'] as int,
      itemsDiscount: map['items_discount'] as int,
      itemsActive: map['items_active'] as int,
      itemsCount: map['items_count'] as int,
      itemsImage: map['items_image'] as String,
      itemsDescription: map['items_description'] as String,
      itemsDescriptionAr: map['items_description_ar'] as String,
      itemsDatetime: map['items_datetime'] as String,
      itemsCategory: map['items_category'] as int,
      favorite: map['favorite'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Item(itemsId: $itemsId, itemsName: $itemsName, itemsNameAr: $itemsNameAr, itemsPrice: $itemsPrice, itemsDiscount: $itemsDiscount, itemsActive: $itemsActive, itemsCount: $itemsCount, itemsImage: $itemsImage, itemsDescription: $itemsDescription, itemsDescriptionAr: $itemsDescriptionAr, itemsDatetime: $itemsDatetime, itemsCategory: $itemsCategory, favorite: $favorite)';
  }

  @override
  bool operator ==(covariant Item other) {
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
        other.favorite == favorite;
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
        favorite.hashCode;
  }
}
