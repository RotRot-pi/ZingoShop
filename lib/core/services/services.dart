import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommercecourse/firebase_options.dart';

class AppServices extends GetxService {
  late SharedPreferences sharedPreferences;
  late FirebaseApp firebaseinit;
  AppServices();

  Future<AppServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    firebaseinit = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
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
