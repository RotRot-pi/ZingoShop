import 'package:zingoshop/core/classes/crud.dart';

import 'package:zingoshop/core/constants/api_link.dart';

class ItemData {
  Crud crud;
  ItemData({
    required this.crud,
  });

  getData(var categoryId, var usersId) async {
    var response = await crud.post(ApiLink.items, {
      'categories_id': categoryId.toString(),
      'users_id': usersId.toString()
    });

    return response.fold((l) => l, (r) => r);
  }
}
