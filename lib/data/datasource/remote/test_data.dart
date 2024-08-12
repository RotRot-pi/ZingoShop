import 'package:ecommercecourse/core/classes/crud.dart';

import 'package:ecommercecourse/core/constants/api_link.dart';

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
