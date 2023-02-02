import 'package:flutter/material.dart';
import 'package:double_bladed_axe/double_bladed_axe.dart';
import '../../status_card/user_loadmore_widget.dart';
import '../../status_card/user_loadpre_widget.dart';
import '../../../model/view_model/class_list_viewmodel.dart';
import '../card_class_list.dart/card_lesson_list.dart';
import '../../../pageUtil/page_util.dart';

class ClassCardList extends StatefulWidget {
  final String initPage;
  final String maxPage;
  final String pageMaxContainCount;
  final ListUtil listUtil;
  final ClassListViewModel viewModel;
  final LessonViewPageUtil pageUtil;
  final String? searchString;

  const ClassCardList({
    super.key,
    required this.initPage,
    required this.maxPage,
    required this.pageMaxContainCount,
    required this.listUtil,
    required this.viewModel,
    required this.pageUtil,
    this.searchString,
  });

  @override
  State<ClassCardList> createState() => _ClassCardListState();
}

class _ClassCardListState extends State<ClassCardList> {
  late List<Widget> initWidgets;
  late List<Widget> widgetsTemp;
  late String initPage;
  late String maxPage;
  late String pageMaxContainCount;
  late String? searchString;

  @override
  void initState() {
    super.initState();
    //初始化
    initWidgets = [];
    widgetsTemp = [];
    initPage = widget.initPage;
    maxPage = widget.maxPage;
    pageMaxContainCount = widget.pageMaxContainCount;
    searchString = widget.searchString;
    //注册
    widget.listUtil.setFuncGetLoadMoreWidgets(loadMoreWidget);
    widget.listUtil.setFuncGetLoadPreWidgets(loadPreWidget);
    //初始化
    initWidget();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: MediaQuery.of(context).size.height - 24 * 2 - 46 - 12,
        child: DoubleBladedAxe(
          loadMoreStatusWidget: UserLoadMoreWidget(listUtil: widget.listUtil),
          loadPreStatusWidget: UserLoadPreWidget(listUtil: widget.listUtil),
          initPage: initPage,
          maxPage: maxPage,
          pageMaxContainCount: pageMaxContainCount,
          listUtil: widget.listUtil,
          initWidgets: initWidgets,
        ));
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
    int pageStartIndex = widget.listUtil.getPageStartIndex!();
    await widget.viewModel.loadMore(pageStartIndex, searchString);
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
    int pageEndIndex = widget.listUtil.getPageEndIndex!();
    await widget.viewModel.loadMore(pageEndIndex, searchString);
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
