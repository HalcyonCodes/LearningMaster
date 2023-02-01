import 'package:flutter/material.dart';
import './search_lesson_list/search_lesson_list.dart';
import './page_point_lesson_list/page_point.dart';
import './user_list_lesson_list.dart/user_list_lesson_list.dart';
//--
import 'package:double_bladed_axe/double_bladed_axe.dart';
//--
import '../../model/view_model/lesson_list_viewmodel.dart';
//课时列表组件
class LessonList extends StatefulWidget {
  final String? searchInitString;
  final String initPage;
  final String maxPage;
  final String maxPageContainCount;
  final LessonListViewModel lessonListViewModel;

  const LessonList(
      {super.key,
      this.searchInitString,
      required this.initPage,
      required this.maxPage,
      required this.maxPageContainCount,
      required this.lessonListViewModel
      });

  @override
  State<LessonList> createState() => _LessonListState();
}

class _LessonListState extends State<LessonList> {
  late String? searchInitString;
  late String currentPage;
  late String maxPage;
  late String maxPageContainCount;
  late ScrollController scrollController;
  late ListUtil listUtil;

  
  @override
  void initState() {
    super.initState();
    searchInitString = widget.searchInitString;
    currentPage = widget.initPage;
    maxPage = widget.maxPage;
    maxPageContainCount = widget.maxPageContainCount;
    scrollController = ScrollController();
    listUtil = ListUtil();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
          PagePoint(
            currentPage: currentPage,
            maxPage: maxPage,
            lessonListUtil: listUtil,
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height:
                MediaQuery.of(context).size.height - 24 * 2 - 12 * 2 - 17 - 46,
            child: UserList(
              listUtil: listUtil,
              height: MediaQuery.of(context).size.height - 24 * 2 - 12 * 2 - 17 - 46,
              initPage: currentPage,
              pageMaxContainCount: maxPageContainCount,
              maxPage: maxPage,
              viewModel: widget.lessonListViewModel,
            ),
          )
        ],
      ),
    );
  }
}
