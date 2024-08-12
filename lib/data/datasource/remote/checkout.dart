

import '../../../core/classes/crud.dart';
import '../../../core/constants/api_link.dart';

class CheckoutData{
  final Crud crud;
  CheckoutData(this.crud);

  checkout(var data ) async {
    var response = await crud.post(ApiLink.checkoutOrder, data);
    return response.fold((l) => l, (r) => r);
  }
}