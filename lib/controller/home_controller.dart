import 'package:ecommercecourse/core/classes/request_status.dart';
import 'package:ecommercecourse/core/functions/handing_data.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImpl extends HomeController {
  final AppServices _appServices = Get.find();
  HomeData homeData = HomeData(crud: Get.find());
  RequestStatus requestStatus = RequestStatus.notInitialized;
  late String username;
  late int id;

  List categories = [];
  //items ...

  getData() async {
    requestStatus = RequestStatus.loading;
    print("status1:$requestStatus");
    var response = await homeData.getData();
    requestStatus = handelingData(response);
    print("status2:$requestStatus");
    if (requestStatus == RequestStatus.success) {
      print("response:$response ");
      if (response['status'] == 'success') {
        categories.addAll(response['categories']);
      }
    } else {
      requestStatus;
    }
    update();
  }

  initialData() {
    id = _appServices.sharedPreferences.getInt("id")!;
    username = _appServices.sharedPreferences.getString("username")!;
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
