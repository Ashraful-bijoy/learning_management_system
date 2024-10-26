class TeacherProfileDataModel {
  String? username;
  String? email;
  String? phoneNumber;
  String? dateJoined;
  String? firstName;
  String? lastName;

  TeacherProfileDataModel(
      {this.username,
        this.email,
        this.phoneNumber,
        this.dateJoined,
        this.firstName,
        this.lastName});

  TeacherProfileDataModel.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    email = json['email'];
    phoneNumber = json['phone_number'];
    dateJoined = json['date_joined'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }
}