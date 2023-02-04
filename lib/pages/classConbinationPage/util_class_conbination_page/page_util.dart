class ClassConbinationPageUtil {
  //ConbinationMessageFuture中设置是否显示
  void Function(bool)? _setDisplayInConbinationMessageFuture;
  void Function(bool)? get setDisplayInConbinationMessageFuture =>
      _setDisplayInConbinationMessageFuture;

  void setFuncSetDisplayInConbinationMessageFuture(void Function(bool) func) {
    _setDisplayInConbinationMessageFuture = func;
  }

  //在ConbinationMessageViewModel中修改ConbinationId字段
  void Function(String)? _setConbinationId;
  void Function(String)? get setConbinationId => _setConbinationId;
  void setFuncSetConbinationId(void Function(String) func) {
    _setConbinationId = func;
  }

  //ConbinationMessageFuture中刷新组件显示
  void Function()? _refreshUiInConbinationMessageFuture;
  void Function()? get refreshUiInConbinationMessageFuture =>
      _refreshUiInConbinationMessageFuture;
  void setFuncRefreshUiInConbinationMessageFuture(void Function()? func) {
    _refreshUiInConbinationMessageFuture = func;
  }

  //在ConbinationMessageFuture中使ConbinationId失效
  void Function()? _setConbinationIdNullInConbinationMessageFuture;
  void Function()? get setConbinationIdNullInConbinationMessageFuture =>
      _setConbinationIdNullInConbinationMessageFuture;
  void setFuncSetConbinationIdNullInConbinationMessageFuture(
      void Function()? func) {
    _setConbinationIdNullInConbinationMessageFuture = func;
  }

  //在classProfileFuture中使conbinationId和classId失效
  void Function()? _setRefreshParaNullInClassProfileFuture;
  void Function()? get setRefreshParaNullInClassProfileFuture =>
      _setRefreshParaNullInClassProfileFuture;
  void setFuncSetRefreshParaNullInClassProfileFuture(void Function()? func) {
    _setRefreshParaNullInClassProfileFuture = func;
  }

  //设置classProfileViewModel中的refresh参数
  void Function(String, String)? _setRefreshParaInClassProfileViewModel;
  void Function(String, String)? get setRefreshParaInClassProfileViewModel =>
      _setRefreshParaInClassProfileViewModel;
  void setFuncSetRefreshPara(void Function(String, String)? func) {
    _setRefreshParaInClassProfileViewModel = func;
  }

  //刷新classProfileFuture的Ui
  void Function()? _refreshUiInClassProfileFuture;
  void Function()? get refreshUiInClassProfileFuture =>
      _refreshUiInClassProfileFuture;
  void setFuncRefreshUiInClassProfileFuture(void Function()? func) {
    _refreshUiInClassProfileFuture = func;
  }

  //设置classProfileFuture是否显示
  void Function(bool)? _setIsDisplayInClassProfileFuture;
  void Function(bool)? get setIsDisplayInClassProfileFuture =>
      _setIsDisplayInClassProfileFuture;
  void setFuncSetIsDisplayInClassProfileFuture(void Function(bool)? func) {
    _setIsDisplayInClassProfileFuture = func;
  }

  
}
