import 'package:ecommercecourse/core/classes/crud.dart';

import 'package:ecommercecourse/core/constants/api_link.dart';

class PendingOrderData {
  Crud crud;
  PendingOrderData({
    required this.crud,
  });

  getData(var userId) async {
    var response = await crud.post(ApiLink.pendingOrder, {'user_id': userId});
    print("TestData");
    return response.fold((l) => l, (r) => r);
  }

  deleteData(var orderId) async {
    var response = await crud.post(ApiLink.deleteOrder, {'order_id': orderId});
    return response.fold((l) => l, (r) => r);
  }
}
