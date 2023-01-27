import 'package:flutter/material.dart';
import 'package:learning_master/pages/homePage/components/lesson_list/card_lesson_list/card_lesson_list.dart';
import '../util_lesson_list/util_lesson_list.dart';
import '../function_list_lesson_list.dart/function_list_lesson_list.dart';

//用于http请求和包装好生成的组件列表，这个组件将由用户创建
class UserList extends StatefulWidget {
  final LessonListUtil lessonListUtil;
  final double height;
  final int initPage;
  final int pageMaxContainCount;

  const UserList(
      {super.key,
      required this.lessonListUtil,
      required this.height,
      required this.initPage,
      required this.pageMaxContainCount,
      });

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List<Widget> initWidgets = [];

  int testCount = 0;

  @override
  void initState() {
    super.initState();
    widget.lessonListUtil.setFuncGetLoadMoreWidgets(loadMore);
    widget.lessonListUtil.setFuncGetLoadPreWidgets(loadPre);
    widget.lessonListUtil.setScreenHeight(widget.height);
    initItem();
    testCount = 0;
  }

  @override
  Widget build(BuildContext context) {
    widget.lessonListUtil.setScreenHeight(widget.height);
    return FunctionList(
      initPage: widget.initPage,
      lessonListUtil: widget.lessonListUtil,
      initListItems: initWidgets,
      pagMaxContainCount: widget.pageMaxContainCount,
    );
  }

  //利用viewModel进行Http请求
  Future<List<Widget>> loadPre() async {
    List<Widget> widgets = List.generate(5, (index) {
      testCount++;
      return LessonCard(
          className: 'className',
          lessonId: 'pre$testCount',
          lessonTitle: 'lessonTitle',
          lessonProfile: 'lessonProfile',
          lessonTags: const ['123', '234']);
    });
    return widgets;
  }

  //利用viewModel进行Http请求
  Future<List<Widget>> loadMore() async {
    List<Widget> widgets = List.generate(5, (index) {
      testCount++;
      return LessonCard(
          className: 'className',
          lessonId: 'more$testCount',
          lessonTitle: 'lessonTitle',
          lessonProfile: 'lessonProfile',
          lessonTags: const ['123', '234']);
    });
    return widgets;
  }

  void initItem() {
    initWidgets = List.generate(5, (index) {
      testCount++;
      return LessonCard(
          className: 'className',
          lessonId: 'init$testCount',
          lessonTitle: 'lessonTitle',
          lessonProfile: 'lessonProfile',
          lessonTags: const ['123', '234']);
    });
  }
}
