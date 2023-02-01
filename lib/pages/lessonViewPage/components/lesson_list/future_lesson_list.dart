import 'package:flutter/material.dart';
import './lesson_list.dart';
import '../../model/view_model/lesson_list_viewmodel.dart';
import '../../pageUtil/page_util.dart';

class LessonListFuture extends StatefulWidget {
  final String? classId;
  final String? lessonPage;
  final String? lessonId;
  final String? searchString;
  final LessonListViewModel viewModel;
  final LessonViewPageUtil pageUtil;
  const LessonListFuture({
    super.key,
    this.lessonPage,
    this.lessonId,
    required this.viewModel,
    this.searchString,
    required this.pageUtil,
    this.classId,
  });

  @override
  State<LessonListFuture> createState() => _LessonListFutureState();
}

class _LessonListFutureState extends State<LessonListFuture> {
  late String? lessonPage;
  late String? searchString;
  late String? lessonId;
  late String? classId;
  //ui控制
  bool isDisplay = true;

  @override
  void initState() {
    super.initState();
    lessonPage = widget.lessonPage;
    searchString = widget.searchString;
    lessonId = widget.lessonId;
    classId = widget.classId;
    //注册
    widget.pageUtil.setFuncRefreshUiInFutureLessonList(refreshUi);
    widget.pageUtil.setFuncSetIsDisplayInFutureLessonList(setIsDisplay);
  }

  @override
  Widget build(BuildContext context) {
    return !isDisplay
        ? Container()
        : FutureBuilder(
            future: widget.viewModel
                .refresh(classId, lessonId, searchString),
            builder: ((context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:

                case ConnectionState.waiting:
                  return const Text('waiting');

                case ConnectionState.active:
                  return const Text('active');

                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return const Text('error');
                  } else {
                    return LessonList(
                      initPage: widget.viewModel.initPage!,
                      maxPage: widget.viewModel.maxPage!,
                      searchInitString: searchString,
                      maxPageContainCount:
                          widget.viewModel.pageMaxContainerCount!,
                      lessonListViewModel: widget.viewModel,
                    );
                  }
              }
            }),
          );
  }

  void setIsDisplay(bool b) {
    isDisplay = b;
  }

  void refreshUi() {
    setState(() {});
  }
}
