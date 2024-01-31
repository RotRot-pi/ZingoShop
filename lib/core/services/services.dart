// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppServices extends GetxService {
  late SharedPreferences sharedPreferences;
  AppServices();

  Future<AppServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initializeServices() async {
  try {
    print('==============++INITIALIZING SERVICES++==============');
    await Get.putAsync(() => AppServices().init());
    print('Done');
  } catch (e) {
    print('Error: $e');
  }
}
