class ClassConbinationModel {
  late String? code;
  late String? message;
  late ClassConbinationData data;

  ClassConbinationModel();

  ClassConbinationModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = ClassConbinationData();
      data = ClassConbinationData.fromJson(json['data']);
    }
  }
}

class ClassConbinationData {
  late String? initPage;
  late String? maxPage;
  late String? maxPageContainCount;

  late List<ConbinationCard> conbinationCards;

  ClassConbinationData();

  ClassConbinationData.fromJson(Map<String, dynamic> json) {
    initPage = json['initPage'];
    maxPage = json['maxPage'];
    maxPageContainCount = json['maxPageContainCount'];

    if (json['conbinationCards'] != null) {
      conbinationCards = [];
      json['conbinationCards'].forEach((e) {
        ConbinationCard card = ConbinationCard();
        card = ConbinationCard.fromJson(e);
        conbinationCards.add(card);
      });
    }
  }
}

class ConbinationCard {
  late String? conbinationId;
  late String? classCount;
  late String? conbinationTitle;
  late String? difficultyLevel;
  late String? lengthLevel;
  late String? usabilityLevel;

  ConbinationCard();

  ConbinationCard.fromJson(Map<String, dynamic> json) {
    conbinationId = json['conbinationId'];
    classCount = json['classCount'];
    conbinationTitle = json['conbinationTitle'];
    difficultyLevel = json['difficultyLevel'];
    lengthLevel = json['lengthLevel'];
    usabilityLevel = json['usabilityLevel'];
  }
}
