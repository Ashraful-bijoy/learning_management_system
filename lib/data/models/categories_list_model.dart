import 'package:learning_management_system/data/models/categories_list_data_model.dart';
import 'package:learning_management_system/data/models/subcategories_list_model.dart';

class CategoriesListModel {
  List<CategoriesListDataModel>? categoriesList;
  String? message;

  CategoriesListModel({this.categoriesList, this.message});

  CategoriesListModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      categoriesList = <CategoriesListDataModel>[];
      json['data'].forEach((v) {
        categoriesList!.add(CategoriesListDataModel.fromJson(v));
      });
    }
    message = json['message'];
  }

}
