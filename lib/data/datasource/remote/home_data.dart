import 'package:ecommercecourse/core/classes/crud.dart';

import 'package:ecommercecourse/core/constants/api_link.dart';

class HomeData {
  Crud crud;
  HomeData({
    required this.crud,
  });

  getData() async {
    var response = await crud.post(ApiLink.home, {});
    print("HomeData");
    return response.fold((l) => l, (r) => r);
  }
}
