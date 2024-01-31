import 'dart:io';
import "package:http/http.dart" as http;

checkInternet() async {
  try {
    final result = await http.get(Uri.parse('https://www.google.com'));
    if (result.statusCode >= 200 && result.statusCode < 300) {
      return true;
    } else {
      return false;
    }
  } on SocketException catch (_) {
    return false;
  }
  // try {
  //   List<InternetAddress> result = await InternetAddress.lookup("google.com");
  //   if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
  //     return true;
  //   }
  // } on SocketException catch (_) {
  //   return false;
  // }
}
