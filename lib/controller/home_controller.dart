import 'package:ecommercecourse/core/classes/request_status.dart';
import 'package:ecommercecourse/core/functions/handing_data.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/home_data.dart';
import 'package:ecommercecourse/data/model/categories.dart';
import 'package:ecommercecourse/data/model/items.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {}

class HomeControllerImpl extends HomeController {
  final AppServices _appServices = Get.find();
  HomeData homeData = HomeData(crud: Get.find());
  RequestStatus requestStatus = RequestStatus.notInitialized;
  late String username;
  late int id;

  List<Category> categories = [];
  List<Item> items = [];
  getData() async {
    requestStatus = RequestStatus.loading;
    print("status1:$requestStatus");
    var response = await homeData.getData();
    requestStatus = handelingData(response);
    print("status2:$requestStatus");
    if (requestStatus == RequestStatus.success) {
      print("response:$response ");
      if (response['status'] == 'success') {
        response['categories'].forEach((element) {
          categories.add(Category.fromMap(element));
        });
        response['items'].forEach((element) {
          items.add(Item.fromMap(element));
        });
        print("categories:${categories}");
        print("items:${items}");
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
    getData();
    super.onInit();
  }
}
