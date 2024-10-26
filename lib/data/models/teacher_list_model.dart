import 'package:learning_management_system/data/models/teacher_details_data_model.dart';

class TeacherDetailsModel {
  List<TeacherDetailsDataModel>? teacherDetailsData;
  String? message;

  TeacherDetailsModel({this.teacherDetailsData, this.message});

  TeacherDetailsModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      teacherDetailsData = <TeacherDetailsDataModel>[];
      json['data'].forEach((v) {
        teacherDetailsData!.add(TeacherDetailsDataModel.fromJson(v));
      });
    }
    message = json['message'];
  }

}



