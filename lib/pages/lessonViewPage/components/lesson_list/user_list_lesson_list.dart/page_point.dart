import 'package:flutter/material.dart';
import 'package:learning_master/config/index.dart';
import 'package:double_bladed_axe/double_bladed_axe.dart';
import '../../../pageUtil/page_util.dart';

//页面的页数指示器
class PagePoint extends StatefulWidget {
  final ListUtil lessonListUtil;
  final LessonViewPageUtil pageutil;

  const PagePoint(
      {super.key, required this.pageutil, required this.lessonListUtil});

  @override
  State<PagePoint> createState() => _PagePointState();
}

class _PagePointState extends State<PagePoint> {
  late int currentPage;
  late int maxPage;
  // PageChange pageChange = PageChange();

  @override
  void initState() {
    super.initState();
    currentPage = 0;
    maxPage = 0;
    //注册
    widget.lessonListUtil
        .setFuncScrollListenerFunc(refreshDisplayInScrollListener);
    widget.pageutil.setFuncInitPagePoint(initPageDisplay);
    initPageDisplay();
  
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 17,
      child: Text(
        '第 $currentPage / $maxPage 页',
        style: KFont.pagePoint,
      ),
    );
  }

  void refresh() {
    setState(() {});
  }

  void initPageDisplay() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      int pageTemp = widget.lessonListUtil.getCurrentPageInFunctionList!();
      int maxPageTemp = widget.lessonListUtil.getMaxPageInFunctionList!();
      currentPage = pageTemp;
      maxPage = maxPageTemp;
      refresh();
    });
  }

  void refreshDisplayInScrollListener() {
    int pageTemp = widget.lessonListUtil.getCurrentPageInFunctionList!();
    int maxPageTemp = widget.lessonListUtil.getMaxPageInFunctionList!();
    currentPage = pageTemp;
    maxPage = maxPageTemp;
    //print(maxPage);
    refresh();
  }
}
