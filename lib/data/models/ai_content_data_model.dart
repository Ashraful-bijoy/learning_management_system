class AiContentDataModel {
  String? data;
  String? message;

  AiContentDataModel({this.data, this.message});

  AiContentDataModel.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    message = json['message'];
  }

}
