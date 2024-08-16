// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:zingoshop/core/classes/crud.dart';
import 'package:zingoshop/core/constants/api_link.dart';

class VerfiySinUpCodeData {
  Crud crud;
  VerfiySinUpCodeData({
    required this.crud,
  });

  postData(String email, String verifyCode) async {
    var response = await crud.post(ApiLink.verifySignUpCode, {
      'email': email,
      'verifyCode': verifyCode,
    });

    return response.fold((l) => l, (r) => r);
  }

  resentData(String email) async {
    var response = await crud.post(ApiLink.resentVerifyCode, {
      'email': email,
    });

    return response.fold((l) => l, (r) => r);
  }
}
