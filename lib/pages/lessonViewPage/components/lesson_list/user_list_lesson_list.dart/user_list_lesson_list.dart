import 'package:flutter/material.dart';
import '../card_lesson_list/card_lesson_list.dart';
import 'package:double_bladed_axe/double_bladed_axe.dart';
import '../../status_card/user_loadmore_widget.dart';
import '../../status_card/user_loadpre_widget.dart';
import '../../../model/view_model/lesson_list_viewmodel.dart';

//用于http请求和包装好生成的组件列表，这个组件将由用户创建
class UserList extends StatefulWidget {
  final ListUtil listUtil;
  final double height;
  final String initPage;
  final String pageMaxContainCount;
  final String maxPage;
  final LessonListViewModel viewModel;

  const UserList(
      {super.key,
      required this.listUtil,
      required this.height,
      required this.initPage,
      required this.pageMaxContainCount,
      required this.maxPage,
      required this.viewModel});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  late int initPage;
  late int pageMaxContainCount;
  late int maxPage;

  List<Widget> initWidgets = [];

  @override
  void initState() {
    super.initState();
    //注册方法
    widget.listUtil.setFuncGetLoadMoreWidgets(loadMore);
    widget.listUtil.setFuncGetLoadPreWidgets(loadPre);
    widget.listUtil.setScreenHeight(widget.height);
    //初始化
    initPage = int.tryParse(widget.initPage)!;
    pageMaxContainCount = int.tryParse(widget.pageMaxContainCount)!;
    maxPage = int.tryParse(widget.maxPage)!;

    initItem();
  }

  @override
  Widget build(BuildContext context) {
    widget.listUtil.setScreenHeight(widget.height);
    return DoubleBladedAxe(
      initWidgets: initWidgets,
      initPage: widget.initPage,
      maxPage: widget.maxPage,
      pageMaxContainCount: widget.pageMaxContainCount,
      listUtil: widget.listUtil,
      loadMoreStatusWidget: UserLoadMoreWidget(listUtil: widget.listUtil),
      loadPreStatusWidget: UserLoadPreWidget(listUtil: widget.listUtil),
    );
  }

  //利用viewModel进行Http请求
  Future<List<Widget>> loadPre() async {
    List<Widget> widgets = List.generate(
      widget.viewModel.lessonListModel!.data.lessonCards.length, 
      (index) {
        return LessonCard(
            className: widget
                .viewModel.lessonListModel!.data.lessonCards[index].className,
            lessonId: widget
                .viewModel.lessonListModel!.data.lessonCards[index].lessonId,
            lessonTitle: widget
                .viewModel.lessonListModel!.data.lessonCards[index].lessonTitle,
            lessonProfile: widget.viewModel.lessonListModel!.data
                .lessonCards[index].lessonProfile,
            lessonTags: widget
                .viewModel.lessonListModel!.data.lessonCards[index].lessonTags);
    });
    return widgets;
  }

  //利用viewModel进行Http请求
  Future<List<Widget>> loadMore() async {
       List<Widget> widgets = List.generate(
      widget.viewModel.lessonListModel!.data.lessonCards.length, 
      (index) {
        return LessonCard(
            className: widget
                .viewModel.lessonListModel!.data.lessonCards[index].className,
            lessonId: widget
                .viewModel.lessonListModel!.data.lessonCards[index].lessonId,
            lessonTitle: widget
                .viewModel.lessonListModel!.data.lessonCards[index].lessonTitle,
            lessonProfile: widget.viewModel.lessonListModel!.data
                .lessonCards[index].lessonProfile,
            lessonTags: widget
                .viewModel.lessonListModel!.data.lessonCards[index].lessonTags);
    });
    return widgets;
  }

  void initItem() {
    initWidgets = [];
    initWidgets = List.generate(
        widget.viewModel.lessonListModel!.data.lessonCards.length, (index) {
      return LessonCard(
          className: widget
              .viewModel.lessonListModel!.data.lessonCards[index].className,
          lessonId: widget
              .viewModel.lessonListModel!.data.lessonCards[index].lessonId,
          lessonTitle: widget
              .viewModel.lessonListModel!.data.lessonCards[index].lessonTitle,
          lessonProfile: widget
              .viewModel.lessonListModel!.data.lessonCards[index].lessonProfile,
          lessonTags: widget
              .viewModel.lessonListModel!.data.lessonCards[index].lessonTags);
    });
  }
}
