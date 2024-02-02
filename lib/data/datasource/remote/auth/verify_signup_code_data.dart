// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecommercecourse/core/classes/crud.dart';
import 'package:ecommercecourse/core/constants/api_link.dart';

class VerfiySinUpCodeData {
  Crud crud;
  VerfiySinUpCodeData({
    required this.crud,
  });

  postData(String email, String verifyCode) async {
    print("Code from post data :$verifyCode");
    var response = await crud.post(ApiLink.verifySignUpCode, {
      'email': email,
      'verifyCode': verifyCode,
    });
    print("response data:$response");
    return response.fold((l) => l, (r) => r);
  }
}
