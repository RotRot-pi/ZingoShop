import 'package:zingoshop/core/classes/crud.dart';

import 'package:zingoshop/core/constants/api_link.dart';

class HomeData {
  Crud crud;
  HomeData({
    required this.crud,
  });

  getData() async {
    var response = await crud.post(ApiLink.home, {});

    return response.fold((l) => l, (r) => r);
  }

  searchData(var search) async {
    var response = await crud.post(ApiLink.search, {"search": search});
    return response.fold((l) => l, (r) => r);
  }
}
