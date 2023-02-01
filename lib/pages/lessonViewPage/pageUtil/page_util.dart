class LessonViewPageUtil {
  //FutureLessonList中控制是否显示元件
  void Function(bool)? _setIsDisplayInFutureLesssonList;
  void Function(bool)? get setIsDisplayInFutureLessonList =>
      _setIsDisplayInFutureLesssonList;
  void setFuncSetIsDisplayInFutureLessonList(void Function(bool)? func) {
    _setIsDisplayInFutureLesssonList = func;
  }

  //FutureLessonList中控制刷新
  void Function()? _refreshUiInFutureLessonList;
  void Function()? get refreshUiInFutureLessonList =>
      _refreshUiInFutureLessonList;
  void setFuncRefreshUiInFutureLessonList(void Function()? func) {
    _refreshUiInFutureLessonList = func;
  }

  //lesson_list_viewModel中修改当前classId
  void Function(String)? _setClassId;
  void Function(String)? get setClassId => _setClassId;
  void setFuncSetClassId(void Function(String) func) {
    _setClassId = func;
  }
}
