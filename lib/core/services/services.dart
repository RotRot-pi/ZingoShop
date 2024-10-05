import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:zingoshop/core/constants/api_link.dart';
import 'package:zingoshop/core/functions/fcm_config.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zingoshop/firebase_options.dart';

class AppServices extends GetxService {
  late SharedPreferences sharedPreferences;
  late FirebaseApp firebaseinit;
  late FirebaseMessaging messaging;
  late Position position;
  AppServices();

  Future<AppServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    firebaseinit = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    messaging = await requestNotificationPermission();
    fcmConfig();
    position = await getCurrentPosition();
    initStripe();
    return this;
  }
}

initializeServices() async {
  try {
    await Get.putAsync(() => AppServices().init());
  } catch (e) {
    throw Exception(e);
  }
}

Future<Position> getCurrentPosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  return Geolocator.getCurrentPosition();
}

initStripe() {
  Stripe.publishableKey = ApiLink.stripePublishableKey;
}
