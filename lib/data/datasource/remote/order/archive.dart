import 'package:ecommercecourse/core/classes/crud.dart';

import 'package:ecommercecourse/core/constants/api_link.dart';

class ArchiveOrderData {
  Crud crud;
  ArchiveOrderData({
    required this.crud,
  });

  getData(var userId) async {
    var response = await crud.post(ApiLink.archiveOrder, {'user_id': userId});
    
    return response.fold((l) => l, (r) => r);
  }

  postRating(var orderId, var rating, var comment) async {
    var response = await crud.post(ApiLink.orderRating, {
      'order_id': orderId,
      'order_rating': rating,
      'order_notating': comment
    });
    return response.fold((l) => l, (r) => r);
  }
}
