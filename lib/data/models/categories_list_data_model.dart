import 'package:learning_management_system/data/models/subcategories_list_model.dart';

class CategoriesListDataModel {
  String? name;
  String? description;
  bool? status;
  String? slug;
  List<SubcategoriesListModel>? subcategoriesList;

  CategoriesListDataModel(
      {this.name,
        this.description,
        this.status,
        this.slug,
        this.subcategoriesList});

  CategoriesListDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    status = json['status'];
    slug = json['slug'];
    if (json['subcategories'] != null) {
      subcategoriesList = <SubcategoriesListModel>[];
      json['subcategories'].forEach((v) {
        subcategoriesList!.add(SubcategoriesListModel.fromJson(v));
      });
    }
  }
}