import 'package:ecommercecourse/core/classes/crud.dart';

import 'package:ecommercecourse/core/constants/api_link.dart';

class CheckEmailData {
  Crud crud;
  CheckEmailData({
    required this.crud,
  });

  postData(String email) async {
    var response = await crud.post(ApiLink.checkemail, {"email": email});

    return response.fold((l) => l, (r) => r);
  }
}
