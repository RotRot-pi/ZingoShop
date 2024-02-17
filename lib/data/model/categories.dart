import 'dart:convert';

class CategoriesModel {
  List<Category>? categories;

  CategoriesModel({this.categories});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Category>[];
      json['categories'].forEach((v) {
        categories!.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Category {
  int categoriesId;
  String categoriesName;
  String categoriesNameAr;
  String categoriesDatetime;
  String categoriesImage;
  Category({
    required this.categoriesId,
    required this.categoriesName,
    required this.categoriesNameAr,
    required this.categoriesDatetime,
    required this.categoriesImage,
  });

  Category copyWith({
    int? categoriesId,
    String? categoriesName,
    String? categoriesNameAr,
    String? categoriesDatetime,
    String? categoriesImage,
  }) {
    return Category(
      categoriesId: categoriesId ?? this.categoriesId,
      categoriesName: categoriesName ?? this.categoriesName,
      categoriesNameAr: categoriesNameAr ?? this.categoriesNameAr,
      categoriesDatetime: categoriesDatetime ?? this.categoriesDatetime,
      categoriesImage: categoriesImage ?? this.categoriesImage,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'categories_id': categoriesId,
      'categories_name': categoriesName,
      'categories_name_ar': categoriesNameAr,
      'categories_datetime': categoriesDatetime,
      'categories_image': categoriesImage,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      categoriesId: map['categories_id'] as int,
      categoriesName: map['categories_name'] as String,
      categoriesNameAr: map['categories_name_ar'] as String,
      categoriesDatetime: map['categories_datetime'] as String,
      categoriesImage: map['categories_image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Category(categories_id: $categoriesId, categories_name: $categoriesName, categories_name_ar: $categoriesNameAr, categories_datetime: $categoriesDatetime, categories_image: $categoriesImage)';
  }

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.categoriesId == categoriesId &&
        other.categoriesName == categoriesName &&
        other.categoriesNameAr == categoriesNameAr &&
        other.categoriesDatetime == categoriesDatetime &&
        other.categoriesImage == categoriesImage;
  }

  @override
  int get hashCode {
    return categoriesId.hashCode ^
        categoriesName.hashCode ^
        categoriesNameAr.hashCode ^
        categoriesDatetime.hashCode ^
        categoriesImage.hashCode;
  }
}
