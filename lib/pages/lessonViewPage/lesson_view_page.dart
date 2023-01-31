import "package:flutter/material.dart";
import '../../config/index.dart';
import './components/nav/nav.dart';
import './components/class_list/future_class_list.dart';
import './components/lesson_list/lesson_list.dart';
//viewModel
import './model/view_model/class_list_viewmodel.dart';

//util
import './pageUtil/page_util.dart';

class LessonViewPage extends StatefulWidget {
  final String? classListSearchString;
  final String? classListClassId;
  final String? classListPage;

  const LessonViewPage(
      {super.key,
      this.classListClassId,
      this.classListPage,
      this.classListSearchString});

  @override
  State<LessonViewPage> createState() => _LessonViewPageState();
}

class _LessonViewPageState extends State<LessonViewPage> {
  late String? classListSearchString;
  late String? classListClassId;
  late String? classListPage;

  //pageUtil
  LessonViewPageUtil pageUtil = LessonViewPageUtil();
  //viewModel
  late ClassListViewModel classListViewModel;

  @override
  void initState() {
    super.initState();
    //初始化
    classListClassId = widget.classListClassId;
    classListPage = widget.classListPage;
    classListSearchString = widget.classListSearchString;
    classListViewModel = ClassListViewModel(pageUtil: pageUtil);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width <= 1920
              ? 1920
              : MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //导航
                  const Nav(
                    avatarPath:
                        'https://c-ssl.duitang.com/uploads/blog/202107/23/20210723125859_f6b2f.jpeg',
                    currentIndex: 0,
                    userName: 'reddock',
                  ),
                  //课程
                  Container(
                    margin: const EdgeInsets.only(left: 24),
                    child: ClassListFuture(
                      pageUtil: pageUtil,
                      viewModel: classListViewModel,
                      searchString: classListSearchString,
                      classId: classListClassId,
                      page: classListPage,
                    ),
                  ),
                  //课时
                  Container(
                    margin: const EdgeInsets.only(left: 24),
                    child: LessonList(
                      currentPage: '10',
                      maxPage: '15',
                      height: MediaQuery.of(context).size.height,
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
