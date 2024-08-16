import 'package:zingoshop/core/classes/crud.dart';

import 'package:zingoshop/core/constants/api_link.dart';

class OrderDetailsData {
  Crud crud;
  OrderDetailsData({
    required this.crud,
  });

  getData(var orderId) async {
    var response = await crud.post(ApiLink.orderDetails, {'order_id': orderId});

    return response.fold((l) => l, (r) => r);
  }
}
