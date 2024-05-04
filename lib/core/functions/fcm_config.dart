import 'package:ecommercecourse/controller/order/pending.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:get/get.dart';

fcmConfig() {
  FirebaseMessaging.onMessage.listen((message) {
    FlutterRingtonePlayer().playNotification();
    Get.snackbar(message.notification!.title!, message.notification!.body!);
    refreshOrderPage(message.data);
  });
}

refreshOrderPage(Map<String, dynamic> data) {
  if (data['page_name'] == 'refresh_pending_order' &&
      Get.currentRoute == '/pending') {
    Get.find<PendingOrderController>().onNotificationRefresh();
  }
}

Future<FirebaseMessaging> requestNotificationPermission() async {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');
  return messaging;
}
