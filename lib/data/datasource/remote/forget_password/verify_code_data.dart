import 'package:ecommercecourse/core/classes/crud.dart';

import 'package:ecommercecourse/core/constants/api_link.dart';

class VerifyCodeData {
  Crud crud;
  VerifyCodeData({
    required this.crud,
  });

  postData(String email, String verifyCode) async {
    var response = await crud
        .post(ApiLink.verifyCode, {"email": email, "verifyCode": verifyCode});

    return response.fold((l) => l, (r) => r);
  }
}
