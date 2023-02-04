class ClassProfileModel {
  late String code;
  late String message;
  late ClassProfileModelData data;

  ClassProfileModel();

  ClassProfileModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = ClassProfileModelData();
      data = ClassProfileModelData.fromJson(json['data']);
    }
  }
}

class ClassProfileModelData {
  late String conbinationId;
  late String classId;
  late String profile;

  ClassProfileModelData();

  ClassProfileModelData.fromJson(Map<String, dynamic> json) {
    conbinationId = json['conbinationId'];
    classId = json['classId'];
    profile = json['profile'];
  }
}
