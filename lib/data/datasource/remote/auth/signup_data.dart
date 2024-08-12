import 'package:ecommercecourse/core/classes/crud.dart';

import 'package:ecommercecourse/core/constants/api_link.dart';

class SignUpData {
  Crud crud;
  SignUpData({
    required this.crud,
  });

  postData(String name, String email, String password, String phone) async {
    var response = await crud.post(ApiLink.signUp,
        {"name": name, "email": email, "password": password, "phone": phone});

    return response.fold((l) => l, (r) => r);
  }
}
