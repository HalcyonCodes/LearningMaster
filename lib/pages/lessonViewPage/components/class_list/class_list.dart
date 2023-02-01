import 'package:flutter/material.dart';
import 'search_class_list.dart/search_lesson_list.dart';
import 'card_class_list.dart/card_lesson_list.dart';
import 'package:double_bladed_axe/double_bladed_axe.dart';
import '../../model/view_model/class_list_viewmodel.dart';
import '../status_card/user_loadmore_widget.dart';
import '../status_card/user_loadpre_widget.dart';
import '../../pageUtil/page_util.dart';

//课程卡片列表
class ClassList extends StatefulWidget {
  final String? initString;
  final String initPage;
  final String maxPage;
  final String pageMaxContainerCount;
  final LessonViewPageUtil pageUtil;
  final ClassListViewModel viewModel;

  const ClassList({
    super.key,
    this.initString,
    required this.initPage,
    required this.maxPage,
    required this.pageMaxContainerCount,
    required this.viewModel,
    required this.pageUtil,
  });
  @override
  State<ClassList> createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  ListUtil listUtil = ListUtil();
  late String? initString;
  late String initPage;
  late String maxPage;
  late String pageMaxContainerCount;
  late List<Widget> initWidgets;
  late List<Widget> widgetsTemp;

  @override
  void initState() {
    super.initState();
    //初始化
    initString = widget.initString;
    initPage = widget.initPage;
    maxPage = widget.maxPage;
    pageMaxContainerCount = widget.pageMaxContainerCount;
    initWidgets = [];
    widgetsTemp = [];
    //注册
    listUtil.setFuncGetLoadMoreWidgets(loadMoreWidget);
    listUtil.setFuncGetLoadPreWidgets(loadPreWidget);
    //初始化
    initWidget();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width >= 1920
          ? ((MediaQuery.of(context).size.width - 24) / 24) * 5 - 24
          : (1920 - 24) / 24 * 5 - 24,
      height: MediaQuery.of(context).size.height - 24 * 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClassSearch(initSearchString: widget.initString),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height - 24 * 2 - 46 - 12,
              child: DoubleBladedAxe(
                loadMoreStatusWidget: UserLoadMoreWidget(listUtil: listUtil),
                loadPreStatusWidget: UserLoadPreWidget(listUtil: listUtil),
                initPage: initPage,
                maxPage: maxPage,
                pageMaxContainCount: pageMaxContainerCount,
                listUtil: listUtil,
                initWidgets: initWidgets,
              )),
        ],
      ),
    );
  }

  void initWidget() {
    initWidgets = [];
    initWidgets = List.generate(
        widget.viewModel.classListModel!.data.classCards.length, (index) {
      return ClassCard(
        className:
            widget.viewModel.classListModel!.data.classCards[index].className,
        classCount:
            widget.viewModel.classListModel!.data.classCards[index].classCount,
        classId:
            widget.viewModel.classListModel!.data.classCards[index].classId,
        classStatus:
            widget.viewModel.classListModel!.data.classCards[index].classStatus,
        lastUpdateTime: widget
            .viewModel.classListModel!.data.classCards[index].lastUpdateTime,
        onClick: () {
          widget.pageUtil.setClassId!(
              widget.viewModel.classListModel!.data.classCards[index].classId);
          widget.pageUtil.setIsDisplayInFutureLessonList!(true);
          widget.pageUtil.refreshUiInFutureLessonList!();
        },
      );
    });
    int a;
  }

  Future<List<Widget>> loadPreWidget() async {
    widgetsTemp = [];
    int pageStartIndex = listUtil.getPageStartIndex!();
    await widget.viewModel.loadMore(pageStartIndex, initString);
    widgetsTemp = List.generate(
        widget.viewModel.classListModel!.data.classCards.length, (index) {
      return ClassCard(
        className:
            widget.viewModel.classListModel!.data.classCards[index].className,
        classCount:
            widget.viewModel.classListModel!.data.classCards[index].classCount,
        classId:
            widget.viewModel.classListModel!.data.classCards[index].classId,
        classStatus:
            widget.viewModel.classListModel!.data.classCards[index].classStatus,
        lastUpdateTime: widget
            .viewModel.classListModel!.data.classCards[index].lastUpdateTime,
        onClick: () {},
      );
    });
    return widgetsTemp;
  }

  Future<List<Widget>> loadMoreWidget() async {
    widgetsTemp = [];
    int pageEndIndex = listUtil.getPageEndIndex!();
    await widget.viewModel.loadMore(pageEndIndex, initString);
    widgetsTemp = List.generate(
        widget.viewModel.classListModel!.data.classCards.length, (index) {
      return ClassCard(
        className:
            widget.viewModel.classListModel!.data.classCards[index].className,
        classCount:
            widget.viewModel.classListModel!.data.classCards[index].classCount,
        classId:
            widget.viewModel.classListModel!.data.classCards[index].classId,
        classStatus:
            widget.viewModel.classListModel!.data.classCards[index].classStatus,
        lastUpdateTime: widget
            .viewModel.classListModel!.data.classCards[index].lastUpdateTime,
        onClick: () {},
      );
    });
    return widgetsTemp;
  }
}
