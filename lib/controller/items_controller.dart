import 'package:ecommercecourse/core/classes/request_status.dart';
import 'package:ecommercecourse/core/constants/routes_name.dart';
import 'package:ecommercecourse/core/functions/handing_data.dart';
import 'package:ecommercecourse/core/services/services.dart';
import 'package:ecommercecourse/data/datasource/remote/item_data.dart';
import 'package:ecommercecourse/data/model/items.dart';
import 'package:get/get.dart';

abstract class ItemsController extends GetxController {
  initialData();
  getItems(var categoryId);
  changeCategory(int index, var categoryId);
  goToProductDetails(Item item);
}

class ItemsControllerImpl extends ItemsController {
  final AppServices _appServices = Get.find();
  ItemData itemData = ItemData(crud: Get.find());
  late RequestStatus requestStatus = RequestStatus.notInitialized;
  List categories = [];
  List items = [];
  int? categoryIndex;
  var categoryId;

  @override
  getItems(var newCategoryId) async {
    items.clear();
    requestStatus = RequestStatus.loading;
    print("status1:$requestStatus");
    var response = await itemData.getData(
        newCategoryId, _appServices.sharedPreferences.getInt("id"));
    requestStatus = handelingData(response);
    print("status2:$requestStatus");
    if (requestStatus == RequestStatus.success &&
        response['status'] == 'success') {
      print("response:$response ");

      // response['categories'].forEach((element) {
      //   categories.add(Item.fromMap(element));
      // });
      response['data'].forEach((element) {
        items.add(Item.fromMap(element));
      });
      print("categories:${categories}");
      print("items:${items}");
    } else if (response['status'] == 'failure') {
      requestStatus = RequestStatus.failure;
      print("Current RequestStatus:$requestStatus");
      update();
    } else {
      requestStatus = RequestStatus.failure;
    }

    update();
  }

  @override
  initialData() {
    categories = Get.arguments['categories'];
    categoryIndex = Get.arguments['categoryIndex'];
    categoryId = Get.arguments['categoryId'];

    print("cat:$categories \ncategoryIndex:$categoryIndex");
  }

  @override
  changeCategory(int index, var categoryId) {
    categoryIndex = index;
    categoryId = categoryId;
    getItems(categoryId);
    print("new id :$categoryId");

    update();
  }

  @override
  goToProductDetails(Item item) {
    Get.toNamed(AppRoutes.productDetails, arguments: {'item': item});
  }

  @override
  void onInit() {
    initialData();
    getItems(categoryId);
    super.onInit();
  }
}
