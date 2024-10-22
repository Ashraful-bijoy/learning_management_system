import 'package:get/get.dart';
import 'package:learning_management_system/data/models/categories_list_data_model.dart';
import 'package:learning_management_system/data/models/categories_list_model.dart';
import 'package:learning_management_system/data/models/network_response.dart';
import 'package:learning_management_system/data/services/network_caller.dart';
import 'package:learning_management_system/data/utils/urls.dart';

class CategoriesListController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage = '';
  List<CategoriesListDataModel> _categoriesList = [];

  bool get inProgress => _inProgress;

  String? get errorMessage => _errorMessage;

  List<CategoriesListDataModel> get categoriesList => _categoriesList;

  Future<bool> getCategories() async {
    bool isSuccess = false;
    _inProgress = true;
    update();

    NetworkResponse response =
        await Get.find<NetworkCaller>().getRequest(url: Urls.categoriesUrl);

    if (response.isSuccess) {
      isSuccess = true;
      _errorMessage = null;
      _categoriesList =
          CategoriesListModel.fromJson(response.responseData).categoriesList ??
              [];
    } else {
      _errorMessage = response.errorMessage;
    }

    _inProgress = false;
    update();
    return isSuccess;
  }
}
