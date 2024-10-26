import 'dart:convert';


import 'package:get/get.dart' as getx;
import 'package:get/get_core/get_core.dart';
import 'package:http/http.dart';
import 'package:learning_management_system/data/models/network_response.dart';
import 'package:learning_management_system/presentation/state_holders/auth/auth_controller.dart';
import 'package:learning_management_system/presentation/ui/screens/auth/log_in_screen.dart';
import 'package:logger/logger.dart';

class NetworkCaller {
  final Logger logger;

  NetworkCaller({required this.logger});

  Future<NetworkResponse> getRequest(
      {required String url, String? token}) async {
    try {
      Uri uri = Uri.parse(url);
      requestLog(url, {}, {}, '');

      final Response response = await get(
        uri,
        headers: {
          'authorization': 'Bearer ${token ?? AuthController.accessToken}',
          'X-Static-Token': 'k7m3qz2zmmp9oux4ghnz10g6l90r77po8v5br4svw6pf5j5qe9fvxr6d849amvsj',
        },
      );

      if (response.statusCode == 200) {
        responseLog(
          url,
          response.statusCode,
          response.body,
          response.headers,
          true,
        );
        final decodeBody = jsonDecode(response.body);
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: true,
            responseData: decodeBody);
      } else {
        responseLog(
          url,
          response.statusCode,
          response.body,
          response.headers,
          false,
        );
        if(response.statusCode == 401) {
          _moveToLogin();
        }
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      responseLog(url, -1, null, {}, false, e);
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> postRequest(
      {required String url, Map<String, dynamic>? body,String? token}) async {
    try {
      Uri uri = Uri.parse(url);
      requestLog(url, {}, body ?? {}, '');

      String? token = await Get.find<AuthController>().getAccessToken();

      final headers = {
        'content-type': 'application/json',
        'X-Static-Token': 'k7m3qz2zmmp9oux4ghnz10g6l90r77po8v5br4svw6pf5j5qe9fvxr6d849amvsj',
      };
      if (token != null) {
        headers['authorization'] = 'Bearer $token';
      }

      final Response response = await post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        responseLog(
          url,
          response.statusCode,
          response.body,
          response.headers,
          true,
        );
        final decodeBody = jsonDecode(response.body);
        return NetworkResponse(
            statusCode: response.statusCode,
            isSuccess: true,
            responseData: decodeBody);
      } else {
        responseLog(
          url,
          response.statusCode,
          response.body,
          response.headers,
          false,
        );
        if(response.statusCode == 401){
          _moveToLogin();
        }
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
        );
      }
    } catch (e) {
      responseLog(url, -1, null, {}, false, e);
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<void> _moveToLogin() async {
    Get.find<AuthController>().clearAllData();
    Get.offAll(() => const LogInScreen());
  }

  void requestLog(String url, Map<String, dynamic> params,
      Map<String, dynamic> body, String token) {
    logger.i('''
    Url : $url,
    Params : $params,
    Body : $body,
    Token : $token,
    ''');
  }

  void responseLog(String url, int statusCode, dynamic responsebody,
      Map<String, dynamic> headers, bool isSuccess,
      [dynamic error]) {
    String message = '''
    Url : $url,
    StatusCode : $statusCode,
    ResponseBody : $responsebody,
    Headers : $headers,
    Error : $error,
    ''';

    if (isSuccess) {
      logger.i(message);
    } else {
      logger.e(message);
    }
  }
}
