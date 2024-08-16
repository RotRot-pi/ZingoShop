import 'package:zingoshop/core/classes/crud.dart';

import 'package:zingoshop/core/constants/api_link.dart';

class OffersData {
  Crud crud;
  OffersData({
    required this.crud,
  });

  getData() async {
    var response = await crud.post(ApiLink.offers, {});

    return response.fold((l) => l, (r) => r);
  }
}
