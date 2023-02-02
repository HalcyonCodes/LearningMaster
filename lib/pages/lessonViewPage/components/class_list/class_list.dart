import 'package:flutter/material.dart';
import 'search_class_list.dart/search_lesson_list.dart';
import 'package:double_bladed_axe/double_bladed_axe.dart';
import '../../model/view_model/class_list_viewmodel.dart';
import '../../pageUtil/page_util.dart';
import './list_card_class_list/future_list_card_class_list.dart';
class ClassList extends StatefulWidget {
  final LessonViewPageUtil pageUtil;
  final ClassListViewModel viewModel;
  final String? searchString;
  final String? classId;

  const ClassList({
    super.key,
    required this.pageUtil,
    required this.viewModel,
    required this.searchString,
    required this.classId,
  });

  @override
  State<ClassList> createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {
  late String? searchString;
  late String? classId;
  @override
  void initState() {
    super.initState();
    searchString = widget.searchString;
    classId = widget.classId;
  }

  ListUtil listUtil = ListUtil();

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
          ClassSearch(initSearchString: searchString),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height - 24 * 2 - 46 - 12,
              child: ClassCardListFuture(
                listUtil: listUtil,
                viewModel: widget.viewModel,
                pageUtil: widget.pageUtil,
                classId: classId,
                searchString: searchString,
              )),
        ],
      ),
    );
  }
}
