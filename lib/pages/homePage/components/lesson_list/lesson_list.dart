import 'package:flutter/material.dart';
import './search_lesson_list/search_lesson_list.dart';
import './page_point_lesson_list/page_point.dart';
import './user_list_lesson_list.dart/user_list_lesson_list.dart';
//--
import './util_lesson_list/util_lesson_list.dart';

//课时列表组件
class LessonList extends StatefulWidget {
  final String? searchInitString;
  final String currentPage;
  final String pages;
  final double height;

  const LessonList(
      {super.key,
      this.searchInitString,
      required this.currentPage,
      required this.pages,
      required this.height});

  @override
  State<LessonList> createState() => _LessonListState();
}

class _LessonListState extends State<LessonList> {
  late String? searchInitString;
  late String currentPage;
  late String pages;
  late ScrollController scrollController;
  late LessonListUtil lessonListUtil;

  @override
  void initState() {
    super.initState();
    searchInitString = widget.searchInitString;
    currentPage = widget.currentPage;
    pages = widget.pages;
    scrollController = ScrollController();
    lessonListUtil = LessonListUtil();
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
            pages: pages,
            lessonListUtil: lessonListUtil,
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height:
                MediaQuery.of(context).size.height - 24 * 2 - 12 * 2 - 17 - 46,
            child: UserList(
              lessonListUtil: lessonListUtil,
              height: widget.height,
              initPage: int.tryParse(currentPage)!,
              pageMaxContainCount: 4,
            ),
          )
        ],
      ),
    );
  }
}
