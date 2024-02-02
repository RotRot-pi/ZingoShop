import 'package:ecommercecourse/core/classes/crud.dart';

import 'package:ecommercecourse/core/constants/api_link.dart';

class LoginData {
  Crud crud;
  LoginData({
    required this.crud,
  });

  postData(String email, String password) async {
    var response =
        await crud.post(ApiLink.login, {"email": email, "password": password});

    return response.fold((l) => l, (r) => r);
  }
}
