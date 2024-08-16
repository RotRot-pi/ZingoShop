import 'package:zingoshop/core/classes/crud.dart';

import 'package:zingoshop/core/constants/api_link.dart';

class TestData {
  Crud crud;
  TestData({
    required this.crud,
  });

  getData() async {
    var response = await crud.post(ApiLink.test, {});

    return response.fold((l) => l, (r) => r);
  }
}
