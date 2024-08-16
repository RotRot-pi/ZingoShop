import 'package:zingoshop/core/services/services.dart';
import 'package:zingoshop/data/datasource/remote/favorite_items_data.dart';
import 'package:zingoshop/data/model/items.dart';
import 'package:get/get.dart';

abstract class FavoriteItemsController extends GetxController {}

class FavoriteItemsControllerImpl extends FavoriteItemsController {
  final AppServices _appServices = Get.find();
  FavoriteItemsData favoriteData = FavoriteItemsData(Get.find());
  //add the favorite items in a Set
  Set favoriteItems = {};
  addItemToFavorite(Item item) {
    if (item.favorite == 1) {
      favoriteItems.add(item.itemsId);
    }
    update();
  }

  //** NOTE: you can do more proper handling here
  //Add error handling
  //Add request status handling
  //Add snackbar to show success or failure message
  changeFavorite(Item item) {
    if (favoriteItems.contains(item.itemsId)) {
      favoriteItems.remove(item.itemsId);
      favoriteData.removeFavorite(
          _appServices.sharedPreferences.getInt("id"), item.itemsId);
    } else {
      favoriteItems.add(item.itemsId);
      favoriteData.addFavorite(
          _appServices.sharedPreferences.getInt("id"), item.itemsId);
    }

    update();
  }
}
