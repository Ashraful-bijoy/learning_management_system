import 'package:learning_management_system/data/models/teacher_profile_data_model.dart';

class TeacherDetailsDataModel {
  int? id;
  TeacherProfileDataModel? teacherProfileData;
  String? createdAt;
  String? updatedAt;
  String? image;
  String? coverImage;
  String? address;
  String? tagline;
  String? bio;
  String? experience;
  String? education;
  String? skills;
  String? interests;
  String? certification;
  String? publications;
  String? awards;
  String? projects;
  String? hourlyRate;
  bool? status;

  TeacherDetailsDataModel(
      {this.id,
        this.teacherProfileData,
        this.createdAt,
        this.updatedAt,
        this.image,
        this.coverImage,
        this.address,
        this.tagline,
        this.bio,
        this.experience,
        this.education,
        this.skills,
        this.interests,
        this.certification,
        this.publications,
        this.awards,
        this.projects,
        this.hourlyRate,
        this.status});

  TeacherDetailsDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teacherProfileData = json['user'] != null ? TeacherProfileDataModel.fromJson(json['user']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image = json['image'];
    coverImage = json['coverImage'];
    address = json['address'];
    tagline = json['tagline'];
    bio = json['bio'];
    experience = json['experience'];
    education = json['education'];
    skills = json['skills'];
    interests = json['interests'];
    certification = json['certification'];
    publications = json['publications'];
    awards = json['awards'];
    projects = json['projects'];
    hourlyRate = json['hourlyRate'];
    status = json['status'];
  }

}