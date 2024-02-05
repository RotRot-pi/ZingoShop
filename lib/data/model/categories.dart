class CategoriesModel {
  List<Categories>? categories;

  CategoriesModel({this.categories});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
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

class Categories {
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesDatetime;
  String? categoriesImage;

  Categories(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesDatetime,
      this.categoriesImage});

  Categories.fromJson(Map<String, dynamic> json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesDatetime = json['categories_datetime'];
    categoriesImage = json['categories_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_datetime'] = categoriesDatetime;
    data['categories_image'] = categoriesImage;
    return data;
  }

  @override
  bool operator ==(covariant Categories other) {
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
