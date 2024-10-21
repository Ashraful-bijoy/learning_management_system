import 'package:get/get.dart';
import 'package:learning_management_system/data/models/network_response.dart';
import 'package:learning_management_system/data/services/network_caller.dart';
import 'package:learning_management_system/data/utils/urls.dart';
import 'package:learning_management_system/presentation/state_holders/auth/auth_controller.dart';

class LogInController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage = '';
  String _accessToken = '';

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  String get accessToken => _accessToken;

  Future<bool> logIn(String? userName,String password) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String,dynamic> requestBody = {
      'username': userName,
      'password': password
    };

    NetworkResponse response = await Get.find<NetworkCaller>().postRequest(url: Urls.loginUrl,body: requestBody);

    if(response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      _accessToken = response.responseData['access'];
      await Get.find<AuthController>().saveAccessToken(accessToken);
    }else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;

  }
}