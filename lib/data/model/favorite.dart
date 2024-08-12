// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Favorite {
  final int favoriteId;
  final int favoriteUserId;
  final int favoriteItemId;
  final int itemsId;
  final String itemsName;
  final String itemsNameAr;
  final int itemsPrice;
  final int itemsDiscount;
  final int itemsActive;
  final int itemsCount;
  final String itemsImage;
  final String itemsDescription;
  final String itemsDescriptionAr;
  final String itemsDatetime;
  final int itemsCategory;
  final int userId;

  Favorite({
    required this.favoriteId,
    required this.favoriteUserId,
    required this.favoriteItemId,
    required this.itemsId,
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
    required this.userId,
  });

  Favorite copyWith({
    int? favoriteId,
    int? favoriteUserId,
    int? favoriteItemId,
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
    int? userId,
  }) {
    return Favorite(
      favoriteId: favoriteId ?? this.favoriteId,
      favoriteUserId: favoriteUserId ?? this.favoriteUserId,
      favoriteItemId: favoriteItemId ?? this.favoriteItemId,
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
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'favorite_id': favoriteId,
      'favorite_user_id': favoriteUserId,
      'favorite_item_id': favoriteItemId,
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
      'user_id': userId,
    };
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    return Favorite(
        favoriteId: map['favorite_id'] as int,
        favoriteUserId: map['favorite_user_id'],
        favoriteItemId: map['favorite_item_id'],
        itemsId: map['items_id'],
        itemsName: map['items_name'],
        itemsNameAr: map['items_name_ar'],
        itemsPrice: map['items_price'],
        itemsDiscount: map['items_discount'],
        itemsActive: map['items_active'],
        itemsCount: map['items_count'],
        itemsImage: map['items_image'],
        itemsDescription: map['items_description'],
        itemsDescriptionAr: map['items_description_ar'],
        itemsDatetime: map['items_datetime'],
        itemsCategory: map['items_category'],
        userId: map['user_id']);
  }

  String toJson() => json.encode(toMap());

  factory Favorite.fromJson(String source) =>
      Favorite.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Favorite(favoriteId: $favoriteId, favoriteUserId: $favoriteUserId, favoriteItemId: $favoriteItemId, itemsId: $itemsId, itemsName: $itemsName, itemsNameAr: $itemsNameAr, itemsPrice: $itemsPrice, itemsDiscount: $itemsDiscount, itemsActive: $itemsActive, itemsCount: $itemsCount, itemsImage: $itemsImage, itemsDescription: $itemsDescription, itemsDescriptionAr: $itemsDescriptionAr, itemsDatetime: $itemsDatetime, itemsCategory: $itemsCategory, userId: $userId)';
  }

  @override
  bool operator ==(covariant Favorite other) {
    if (identical(this, other)) return true;

    return other.favoriteId == favoriteId &&
        other.favoriteUserId == favoriteUserId &&
        other.favoriteItemId == favoriteItemId &&
        other.itemsId == itemsId &&
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
        other.userId == userId;
  }

  @override
  int get hashCode {
    return favoriteId.hashCode ^
        favoriteUserId.hashCode ^
        favoriteItemId.hashCode ^
        itemsId.hashCode ^
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
        userId.hashCode;
  }
}
