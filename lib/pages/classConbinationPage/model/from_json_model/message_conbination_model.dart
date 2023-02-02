class ConbinationMessageModel {
  late String code;
  late String message;
  late ConbinationMessageModelData data;

  ConbinationMessageModel();

  ConbinationMessageModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = ConbinationMessageModelData();
      data = ConbinationMessageModelData.fromJson(json['data']);
    }
  }
}

class ConbinationMessageModelData {
  late String conbinationProfile;
  late String classCount;
  late String conbinationId;
  late List<ClassCard> classCards;

  ConbinationMessageModelData();

  ConbinationMessageModelData.fromJson(Map<String, dynamic> json) {
    conbinationProfile = json['conbinationProfile'];
    classCount = json['classCount'];
    conbinationId = json['conbinationId'];
    if (json['classCards'] != null) {
      classCards = [];
      json['classCards'].forEach((e) {
        ClassCard card = ClassCard();
        card = ClassCard.fromJson(e);
        classCards.add(card);
      });
    }
  }
}

class ClassCard {
  late String classId;
  late String className;
  late String classCount;
  late String classStatus;
  late String lastUpdateTime;

  ClassCard();

  ClassCard.fromJson(Map<String, dynamic> json) {
    classId = json['classId'];
    className = json['className'];
    classCount = json['classCount'];
    classStatus = json['classStatus'];
    lastUpdateTime = json['lastUpdateTime'];
  }
}
