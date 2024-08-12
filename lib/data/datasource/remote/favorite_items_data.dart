import 'package:ecommercecourse/core/classes/crud.dart';
import 'package:ecommercecourse/core/constants/api_link.dart';

class FavoriteItemsData {
  final Crud crud;
  FavoriteItemsData(this.crud);

  addFavorite(var usersId, var itemId) async {
    var response = await crud.post(ApiLink.addFavorite, {
      'users_id': usersId.toString(),
      'items_id': itemId.toString(),
    });
    
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(var usersId, var itemId) async {
    var response = await crud.post(ApiLink.removeFavorite, {
      'users_id': usersId.toString(),
      'items_id': itemId.toString(),
    });
    
    return response.fold((l) => l, (r) => r);
  }
}
