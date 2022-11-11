
import './status_util_lesson_list.dart';
import 'package:flutter/material.dart';

class LessonListUtil{

  //播放加载下一个状态指示器的动画
  Future<void> Function(Function())? _startLoadMoreStatusCardAnimate;
  Future<void>Function(Function())? get startLoadMoreStatusCardAniamte => _startLoadMoreStatusCardAnimate;
  void setStartLoadMoreStatusCardAnimate(Future<void> Function(Function())? func){
    _startLoadMoreStatusCardAnimate = func;
  }

  //倒放加载下一个状态指示器动画
  Future<void> Function(Function())? _reverseLoadMoreStatusCardAnimate;
  Future<void> Function(Function())? get reversetLoadMoreStatusCardAniamte => _reverseLoadMoreStatusCardAnimate;
  void setReverseLoadMoreStatusCardAnimate(Future<void> Function(Function())? func){
    _reverseLoadMoreStatusCardAnimate = func;
  }
  

  //播放加载上一个状态指示器的动画
  Future<void> Function(Function())? _startLoadPreStatusCardAnimate;
  Future<void> Function(Function())? get startLoadPreStatusCardAniamte => _startLoadPreStatusCardAnimate;
  void setStartLoadPreStatusCardAnimate(Future<void> Function(Function())? func){
    _startLoadPreStatusCardAnimate = func;
  }

  //倒放加载上一个状态指示器的动画
  Future<void> Function(Function())? _reverseLoadPreStatusCardAnimate;
  Future<void> Function(Function())? get reversetLoadPreStatusCardAniamte => _reverseLoadPreStatusCardAnimate;
  void setReseverLoadPreStatusCardAnimate(Future<void> Function(Function())? func){
    _reverseLoadPreStatusCardAnimate = func;
  }
  
  //指示是否是listView
  bool _isListView = false;
  bool get isListView => _isListView;
  void setIsListView(bool b){
    _isListView = b;
  }

  //获得新加载的SingleChildScrollView里用于过度的页面的高度
  Future<double> Function()? _getSinglePageHeight;
  Future<double> Function()? get getSinglePageHeight => _getSinglePageHeight;
  void setFuncGetSinglePageHeight(Future<double> Function()? func){
     _getSinglePageHeight = func;
  }

  //设置滚动条状态
  Status _status = Status.statusIdel;
  Status get status => _status;
  void setStatus(Status s){
    _status = s;
    setStatuText();
  }

  //设置滚动条状态字符串
  String _statusText = '加载完成';
  String get statusText => _statusText;
  void setStatuText() {
    switch (status) {
      case Status.statusHeadLoading:
        _statusText = '加载中';
        break;
      case Status.statusFootLoading:
        _statusText = '加载中';
        break;
      case Status.statusIdel:
        _statusText = '加载完成';
        break;
      case Status.statusFootLoadFaild:
        _statusText = '加载失败';
        break;
      case Status.statusFootLoadCompleted:
        _statusText = '加载完成';
        break;
      case Status.statusMath:
        _statusText = '加载完成';
        break;
      case Status.statusHeadLoadCompleted:
        _statusText = '加载完成';
        break;
      case Status.statusHeadLoadFaild:
         _statusText = '加载失败';
        break;
    }
  }

  //用于调用http请求并组装组件列表的函数
  Future<List<Widget>>? _getLoadPreWidgets;
  Future<List<Widget>>? get getLoadPreWidgets => _getLoadPreWidgets;
  void setFuncGetLoadPreWidgets(Future<List<Widget>> Function() getHttpWidgets){
      _getLoadPreWidgets = getHttpWidgets();

      
  }

  //用于调用http请求并组装组件列表的函数
  Future<List<Widget>>? _getLoadMoreWidgets;
  Future<List<Widget>>? get getLoadMoreWidgets => _getLoadMoreWidgets;
  void setFuncGetLoadMoreWidgets(Future<List<Widget>> Function() getHttpWidgets){
        _getLoadMoreWidgets = getHttpWidgets();
  }

  //在functionList层计算当前滚动条所在的页面的区间的方法
  Function(ScrollController)? _getCurrentPage;
  Function(ScrollController)? get getCurrentPage => _getCurrentPage;
  void setFuncGetCurrentPage(Function(ScrollController)? func){
    _getCurrentPage = func;
  }

  //窗口的高度
  double? _screenHeight;
  double? get screenHeight => _screenHeight;
  void setScreenHeight(double height){
    _screenHeight = height;
  }

  //functionList中用于加载更多时计算创建组件在滚动条中的高度标识
  Future<void> Function()? _loadMoreMathPageSign;
  Future<void> Function()? get loadMoreMathPageSign => _loadMoreMathPageSign;
  void setFuncLoadMoreMathPageSign(Future<void> Function()? func){
    _loadMoreMathPageSign = func;
  }


  //functionList中用于加载上一个时计算创建组件在滚动条中的高度标识
  Future<void> Function()? _loadPreMathPageSign;
  Future<void> Function()? get loadPreMathPageSign => _loadPreMathPageSign;
  void setFuncLoadPreMathPageSign(Future<void> Function()? func){
    _loadPreMathPageSign = func;
  }

  //滚动条
  ScrollController? _scrollController;
  ScrollController? get scrollController => _scrollController;
  void setScrollController(ScrollController ctrl){
    _scrollController = ctrl;
  }

}


