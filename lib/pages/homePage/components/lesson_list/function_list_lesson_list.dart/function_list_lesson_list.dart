import 'package:flutter/material.dart';
import '../util_lesson_list/util_lesson_list.dart';
import '../switch_list_lesson_list/switch_list_lesson_list.dart';

//计算滚动条所在页面，调整滚动条长度, 裁剪列表元素数量
class FunctionList extends StatefulWidget {
  final List<Widget> initListItems;
  final LessonListUtil lessonListUtil;
  final int initPage; //page是从第几页开始的
  final int pagMaxContainCount; //页面的最大容量，过多时会删除头部或者尾部的item
  const FunctionList(
      {super.key,
      required this.initListItems,
      required this.lessonListUtil,
      required this.initPage,
      required this.pagMaxContainCount});

  @override
  State<FunctionList> createState() => _FunctionListState();
}

class _FunctionListState extends State<FunctionList> {
  Map<int, double> pageSignStart = {}; //标记滚动条中存放元素的列表在滚动条中的起始位置
  int pageStartIndex = 0; //标记栈里的起始页key
  int pageEndIndex = 0; //栈标记里最后一页的key
  double pageTemp = 0; //用于存放从singleChileScrollView获得的页面高度
  int maxPageCount = 1; //page容器的最大容量，超过这个容量则裁剪card
  int pageCount = 0; //当前页面数量
  int currentPage = 0; //当前页面

  @override
  void initState() {
    super.initState();
    //注册方法
    widget.lessonListUtil.setFuncTestSingDisplayInFunctionList(testSignDisplay);
    widget.lessonListUtil
        .setFuncGetCurrentPageHeightInFunctionList(getCurrentPageHeight);
    widget.lessonListUtil.setFuncPushHeightPageInFunctionList(pushHeightPage);
    widget.lessonListUtil
        .setFuncInsertHeightPageInFunctionList(insertHeightPage);
    widget.lessonListUtil
        .setFuncMaintainItemsInLoadMoreInFunctionList(maintainItemsInLoadMore);
    widget.lessonListUtil
        .setFuncMaintainItemsInLoadPreInFunctionList(maintainItemsInLoadPre);
    widget.lessonListUtil
        .setFuncMaintainScrollCtrlInLoadMoreInFunctionList(maintainScrollCtrl);
    widget.lessonListUtil.setFuncSelectPageInFunctionList(selectPage);
    widget.lessonListUtil.setFuncGetCurrentPageInFunctionList(getCurrentPage);
    //初始化
    pageStartIndex = widget.initPage;
    pageEndIndex = pageStartIndex;
    maxPageCount = widget.pagMaxContainCount;
    currentPage = widget.initPage;
    //初始化页面高度标志
    initPageSing();
  }

  @override
  Widget build(BuildContext context) {
    return SwitchList(
        lessonListUtil: widget.lessonListUtil,
        initListItems: widget.initListItems);
  }

  //初始化标记栈
  void initPageSing() {
    pageSignStart[pageStartIndex] = 0;
    pageCount = 0;
  }

  //从pageTemp中获得页面的高度
  void getCurrentPageHeight(double height) async {
    pageTemp = 0;
    pageTemp = height;
  }

  //将pageTemp中的高度压入标记末端
  void pushHeightPage() {
    if (pageCount == maxPageCount - 1) {
      pageStartIndex++;
      pageEndIndex++;
      Map<int, double> temp = {};
      for (int i = pageStartIndex; i <= pageEndIndex; i++) {
        if (pageSignStart.containsKey(i)) {
          if (pageSignStart[i - 2] != null) {
            temp[i] = pageSignStart[i]! -
                pageSignStart[i - 1]! +
                pageSignStart[i - 2]!;
          }

          //计算出差距后需要把之前的高度加入
        } else {
          temp[i] = pageSignStart[i - 2]! + pageTemp;
        }
      }
      temp[pageStartIndex] = 0;
      for (int i = pageStartIndex; i <= pageEndIndex; i++) {
        pageSignStart[i] = temp[i]!;
      }

      //删除头部
      pageSignStart.remove(pageStartIndex - 1);
    } else {
      pageSignStart[pageEndIndex + 1] = pageSignStart[pageEndIndex]! + pageTemp;
      pageCount++;
      pageEndIndex++;
    }
  }

  //将pageTemp中的高度压入标记头部
  void insertHeightPage() {
    if (pageStartIndex <= 0) {
    } else {
      if (pageCount == maxPageCount - 1) {
        //pageSignStart[pageStartIndex - 1] = 0;
        Map<int, double> temp = {};
        temp[pageStartIndex - 1] = 0;
        pageSignStart[pageStartIndex - 1] = 0;
        //所有页面往前挪一位
        for (int i = pageStartIndex; i <= pageEndIndex; i++) {
          //pageSignStart[i] = pageSignStart[i + 1]!;
          if (pageSignStart.containsKey(i + 1)) {
            //pageSignStart[i] = pageSignStart[i + 1]!;
            //pageSignStart[i + 1] = pageSignStart[i + 1]! + pageTemp;
            temp[i] = pageSignStart[i + 1]!;
          } else {
            temp[i] = pageSignStart[i]! + pageTemp;
          }
        }

        for (int i = pageStartIndex; i <= pageEndIndex; i++) {
          pageSignStart[i] = temp[i]!;
        }

        pageSignStart.remove(pageEndIndex);
        pageStartIndex--;
        pageEndIndex--;
      } else {
        pageSignStart[pageStartIndex - 1] = 0;
        //所有页面往前挪一位
        for (int i = pageStartIndex; i <= pageEndIndex; i++) {
          if (pageSignStart.containsKey(i + 1)) {
            pageSignStart[i] = pageSignStart[i + 1]!;
            //pageSignStart[i + 1] = pageSignStart[i + 1]! + pageTemp;
          } else {
            //pageSignStart[i + 1] = pageSignStart[i]! + pageTemp;
            pageSignStart[i] = pageSignStart[i]! + pageTemp;
          }
        }
        pageStartIndex--;
        pageCount++;
      }
    }
  }

  //在加载上一个时维护组件中的item数目
  void maintainItemsInLoadPre() {
    if (pageCount == maxPageCount - 1) {
      widget.lessonListUtil.removeListViewItemOnFootInSwitchList!();
      widget
          .lessonListUtil.removeSingleChildScrollViewItemOnFootInSwitchList!();
    }
  }

  //在加载下一个时维护组件中的item数目
  void maintainItemsInLoadMore() {
    if (pageCount == maxPageCount - 1) {
      widget.lessonListUtil.removeListViewItemOnHeadInSwitchList!();
      widget
          .lessonListUtil.removeSingleChildScrollViewItemOnHeadInSwitchList!();
    }
  }

  //输出调试信息
  void testSignDisplay() {
    print("startIndex: $pageStartIndex");
    print("endIndex: $pageEndIndex");

    for (int i = pageStartIndex; i <= pageEndIndex; i++) {
      print("key: $i ,  val: ${pageSignStart[i]}");
    }
    print("end");
  }

  //裁剪滚动条
  void maintainScrollCtrl() {
    if (pageCount == maxPageCount - 1) {
      widget.lessonListUtil.rebuildScrollCrtlLoadMoreMaintainItemsInSwitchList!(
          pageSignStart[pageStartIndex + 1]! - pageSignStart[pageStartIndex]!);
      widget.lessonListUtil.scrollListenerInSwitchList!();
    } else {
      widget.lessonListUtil.rebuildScrollCtrlLoadMoreAfterInSwitchList!();
    }
  }

  //得到当前位于那个页面
  int getCurrentPage() {
    return currentPage;
  }

  //计算位于哪一页
  void selectPage() {
    double currentPosition =
        widget.lessonListUtil.scrollController!.position.pixels;
    for (int i = pageStartIndex; i <= pageEndIndex; i++) {
      if (pageSignStart.containsKey(i + 1)) {
        if (currentPosition >= pageSignStart[i]! &&
            currentPosition <= pageSignStart[i + 1]!) {
          currentPage = i;
        }
      } else {
        //currentPage = pageEndIndex;
        if (currentPosition >= pageSignStart[i]!) {
          currentPage = i;
        }
      }
    }
    //print('page:$currentPage');
  }
}
