import 'package:learning_management_system/data/models/courses_model.dart';

class SubcategoriesListModel {
  String? name;
  String? description;
  bool? status;
  String? slug;
  List<CoursesModel>? coursesModel;

  SubcategoriesListModel(
      {this.name, this.description, this.status, this.slug, this.coursesModel});

  SubcategoriesListModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    status = json['status'];
    slug = json['slug'];
    if (json['courses'] != null) {
      coursesModel = <CoursesModel>[];
      json['courses'].forEach((v) {
        coursesModel!.add(CoursesModel.fromJson(v));
      });
    }
  }
}