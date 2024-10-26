import 'package:get/get.dart';
import 'package:learning_management_system/data/models/network_response.dart';
import 'package:learning_management_system/data/services/network_caller.dart';
import 'package:learning_management_system/data/utils/urls.dart';
import 'package:learning_management_system/presentation/state_holders/auth/auth_controller.dart';

class AiContentController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage = '';
  String _reply = '';

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  String get reply => _reply;

  Future<bool> getAiContent(String prompt,) async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    Map<String,dynamic> requestBody = {
      'prompt': prompt,
    };

    NetworkResponse response = await Get.find<NetworkCaller>().postRequest(url: Urls.aiContentUrl,body: requestBody,);

    if(response.isSuccess && response.responseData['data'] != null) {
      isSuccess = true;
      _errorMessage = null;
      _reply = response.responseData['data'];
    }else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;

  }
}