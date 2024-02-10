import 'package:ecommercecourse/core/classes/request_status.dart';
import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:ecommercecourse/core/functions/handing_data.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/home_data.dart';
import 'package:ecommercecourse/data/model/categories.dart';
import 'package:ecommercecourse/data/model/items.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  getData();
  initialData();
  goToItems(List categories, int categoryIndex, var categoryId);
}

class HomeControllerImpl extends HomeController {
  final AppServices _appServices = Get.find();
  HomeData homeData = HomeData(crud: Get.find());
  RequestStatus requestStatus = RequestStatus.notInitialized;
  late String username;
  late int id;
  late String language;

  List<Category> categories = [];
  List<Item> items = [];
  @override
  getData() async {
    requestStatus = RequestStatus.loading;
    print("status1:$requestStatus");
    var response = await homeData.getData();
    requestStatus = handelingData(response);
    print("status2:$requestStatus");
    if (requestStatus == RequestStatus.success &&
        response['status'] == 'success') {
      print("response:$response ");

      response['categories'].forEach((element) {
        categories.add(Category.fromMap(element));
      });
      response['items'].forEach((element) {
        items.add(Item.fromMap(element));
      });
      print("categories:${categories}");
      print("items:${items}");
    } else {
      requestStatus = RequestStatus.failure;
    }

    update();
  }

  @override
  initialData() {
    id = _appServices.sharedPreferences.getInt("id")!;
    username = _appServices.sharedPreferences.getString("username")!;
    language = _appServices.sharedPreferences.getString("lang")!;
    print("Controller lang:$language");
  }

  @override
  goToItems(List categories, int categoryIndex, var categoryId) {
    Get.toNamed(AppRoutes.items, arguments: {
      'categories': categories,
      'categoryIndex': categoryIndex,
      'categoryId': categoryId
    });
  }

  @override
  void onInit() {
    initialData();
    getData();
    super.onInit();
  }
}
