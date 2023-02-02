import 'package:flutter/material.dart';
import 'package:learning_master/pages/lessonViewPage/components/lesson_list/user_list_lesson_list.dart/user_list_lesson_list';
import './search_lesson_list/search_lesson_list.dart';
import 'user_list_lesson_list.dart/page_point.dart';
import './user_list_lesson_list.dart/future_user_list_lesson_list.dart';
//--
import 'package:double_bladed_axe/double_bladed_axe.dart';
//--
import '../../model/view_model/lesson_list_viewmodel.dart';
//
import '../../pageUtil/page_util.dart';

//课时列表组件
class LessonList extends StatefulWidget {
  final String? searchInitString;
  final String? classId;
  final String? lessonId;
  final LessonListViewModel lessonListViewModel;
  final LessonViewPageUtil pageUtil;

  const LessonList({
    super.key,
    this.searchInitString,
    this.classId,
    this.lessonId,
    required this.lessonListViewModel,
    required this.pageUtil,
  });

  @override
  State<LessonList> createState() => _LessonListState();
}

class _LessonListState extends State<LessonList> {
  late String? searchInitString;
  late String? classId;
  late String? lessonId;

  late ListUtil listUtil;

  //ui控制
  bool isDisplay = true;

  @override
  void initState() {
    super.initState();
    listUtil = ListUtil();
    searchInitString = widget.searchInitString;
    classId = widget.classId;
    lessonId = widget.lessonId;

    //注册
    widget.pageUtil.setFuncRefreshUiInFutureLessonList(refreshUi);
    widget.pageUtil.setFuncSetIsDisplayInFutureLessonList(setIsDisplay);
  }

  @override
  Widget build(BuildContext context) {
    return !isDisplay
        ? Container(
            width: MediaQuery.of(context).size.width >= 1920
                ? ((MediaQuery.of(context).size.width - 24) / 24) * 5 - 24
                : (1920 - 24) / 24 * 5 - 24,
          )
        : SizedBox(
            height: MediaQuery.of(context).size.height - 24 * 2,
            width: MediaQuery.of(context).size.width >= 1920
                ? ((MediaQuery.of(context).size.width - 24) / 24) * 5 - 24
                : (1920 - 24) / 24 * 5 - 24,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                LessonSearch(
                  initSearchString: widget.searchInitString,
                ),
                const SizedBox(
                  height: 12,
                ),
                UserListFuture(
                    pageUtil: widget.pageUtil,
                    viewModel: widget.lessonListViewModel,
                    listUtil: listUtil,
                    classId: classId,
                    lessonId: lessonId,
                    searchString: searchInitString,
                  )
                  
                
              ],
            ),
          );
  }

  void setIsDisplay(bool b) {
    isDisplay = b;
  }

  void refreshUi() {
    setState(() {});
  }
}
