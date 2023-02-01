class LessonListModel {
  late String code;
  late String message;
  late LessonListData data;

  LessonListModel();

  LessonListModel.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = LessonListData();
      data = LessonListData.fromJson(json['data']);
    }
  }
}

class LessonListData {
  late String initPage;
  late String maxPage;
  late String maxPageContainCount;
  late String classId;
  late List<LessonCard> lessonCards;

  LessonListData();

  LessonListData.fromJson(Map<String, dynamic> json) {
    initPage = json['initPage'];
    maxPage = json['maxPage'];
    maxPageContainCount = json['maxPageContainCount'];
    classId = json['classId'];
    if (json['lessonCards'] != null) {
      lessonCards = [];
      json['lessonCards'].forEach((e) {
        LessonCard card = LessonCard();
        card = LessonCard.forJson(e);
        lessonCards.add(card);
      });
    }
  }
}

class LessonCard {
  late String className;
  late String lessonId;
  late String lessonTitle;
  late String lessonProfile;
  late List<String> lessonTags;

  LessonCard();

  LessonCard.forJson(Map<String, dynamic> json) {
    className = json['className'];
    lessonId = json['lessonId'];
    lessonTitle = json['lessonTitle'];
    lessonProfile = json['lessonProfile'];
    if (json['lessonTags'] != null) {
      lessonTags = [];
      json['lessonTags'].forEach((e) {
        lessonTags.add(e);
      });
    }
  }
}
