import 'package:zingoshop/core/classes/crud.dart';

import 'package:zingoshop/core/constants/api_link.dart';

class NotificationData {
  Crud crud;
  NotificationData({
    required this.crud,
  });

  getData(var userId) async {
    var response = await crud
        .post(ApiLink.notificationView, {'user_id': userId.toString()});

    return response.fold((l) => l, (r) => r);
  }
}
