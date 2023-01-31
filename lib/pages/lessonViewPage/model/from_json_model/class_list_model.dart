class ClassListModel {
  late String code;
  late String message;
  late ClassListModelData data;

  ClassListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = ClassListModelData.fromJson(json['data']);
    }
  }
}

class ClassListModelData {
  late String initPage;
  late String maxPage;
  late String maxPageContainCount;
  late List<ClassCard> classCards;

  ClassListModelData.fromJson(Map<String, dynamic> json) {
    initPage = json['initPage'];
    maxPage = json['maxPage'];
    maxPageContainCount = json['maxPageContainCount'];
    if (json['classCards'] != null) {
      classCards = [];
      json['classCards'].forEach((e) {
        ClassCard classCard = ClassCard();
        classCard = ClassCard.fromJson(e);
        classCards.add(classCard);
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
