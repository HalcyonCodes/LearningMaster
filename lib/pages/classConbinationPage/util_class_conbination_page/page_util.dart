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
  void Function()? _refreshConbinationMessageFuture;
  void Function()? get refreshConbinationMessageFuture =>
      _refreshConbinationMessageFuture;
  void setFuncRefreshConbinationMessageFuture(void Function()? func) {
    _refreshConbinationMessageFuture = func;
  }

  //在ConbinationMessageFuture中使ConbinationId失效
  void Function()? _setConbinationIdNullInConbinationMessageFuture;
  void Function()? get setConbinationIdNullInConbinationMessageFuture => _setConbinationIdNullInConbinationMessageFuture;
  void setFuncSetConbinationIdNullInConbinationMessageFuture(void Function()? func) {
    _setConbinationIdNullInConbinationMessageFuture = func;
  }
}
