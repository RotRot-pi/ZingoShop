import 'package:ecommercecourse/core/classes/request_status.dart';
import 'package:ecommercecourse/core/functions/handing_data.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/favorite_data.dart';
import 'package:ecommercecourse/data/model/favorite.dart';
import 'package:get/get.dart';

abstract class FavoriteController extends GetxController {}

class FavoriteControllerImpl extends FavoriteController {
  final AppServices _appServices = Get.find();
  FavoriteData favoriteData = FavoriteData(Get.find());
  RequestStatus requestStatus = RequestStatus.notInitialized;
  List data = [];

  getData() async {
    data.clear();
    requestStatus = RequestStatus.loading;
    var response =
        await favoriteData.getData(_appServices.sharedPreferences.getInt("id"));

    requestStatus = handelingData(response);
    print("requestStatus:$requestStatus");
    if (requestStatus == RequestStatus.success) {
      print("response:$response ");
      if (response['status'] == 'success') {
        response['data'].forEach((element) {
          data.add(Favorite.fromMap(element));
        });
      } else {
        requestStatus = RequestStatus.failure;
      }
      update();
    }
    print("FavoriteData");
    return response;
  }

  deleteData(var favoriteId) async {
    await favoriteData.deleteData(favoriteId);
    data.removeWhere((element) => element.favoriteId == favoriteId);
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }
}
