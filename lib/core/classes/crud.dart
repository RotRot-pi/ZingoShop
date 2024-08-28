import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:zingoshop/core/classes/request_status.dart';
import 'package:zingoshop/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;

class Crud {
  Future<Either<RequestStatus, Map>> post(String urlLink, Map data) async {
    try {
      if (!await checkInternet()) {
        return const Left(RequestStatus.offline);
      }
      var response = await http.post(

          //Note: some error requires you to use Uri.https() or Uri.http()
          Uri.parse(
            urlLink,
          ),
          body: data);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        try {
          //NOTE: I got a format error because the body was empty
          //      So I used the conditional statement inside jsonDecode
          var responseBody =
              jsonDecode(response.body.isNotEmpty ? response.body : "{}");

          return Right(responseBody);
        } on FormatException {
          return const Left(RequestStatus.formatError);
        }
      } else {
        return const Left(RequestStatus.serverError);
      }
    } catch (e) {
      return const Left(RequestStatus.unknownError);
    }
  }
}
