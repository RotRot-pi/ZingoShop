// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecommercecourse/core/classes/crud.dart';
import 'package:ecommercecourse/core/constants/api_link.dart';

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
}
