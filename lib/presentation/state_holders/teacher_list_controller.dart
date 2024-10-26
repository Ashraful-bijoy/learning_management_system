import 'package:get/get.dart';
import 'package:learning_management_system/data/models/network_response.dart';
import 'package:learning_management_system/data/models/teacher_details_data_model.dart';
import 'package:learning_management_system/data/models/teacher_list_model.dart';
import 'package:learning_management_system/data/services/network_caller.dart';
import 'package:learning_management_system/data/utils/urls.dart';

class TeacherListController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage = '';
  List<TeacherDetailsDataModel> _teacherList = [];

  bool get inProgress => _inProgress;
  String? get errorMessage => _errorMessage;
  List<TeacherDetailsDataModel> get teacherList => _teacherList;

  Future<bool> getTeacherList() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: Urls.teacherListUrl);
    if(response.isSuccess){
      isSuccess = true;
      _errorMessage = null;
      _teacherList = TeacherDetailsModel.fromJson(response.responseData).teacherDetailsData ?? [];
    }else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }

}