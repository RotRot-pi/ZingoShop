import 'package:ecommercecourse/core/classes/crud.dart';

import 'package:ecommercecourse/core/constants/api_link.dart';

class ItemData {
  Crud crud;
  ItemData({
    required this.crud,
  });

  getData(var categoryId) async {
    var response = await crud
        .post(ApiLink.items, {'categories_id': categoryId.toString()});
    print("ItemData");
    return response.fold((l) => l, (r) => r);
  }
}
