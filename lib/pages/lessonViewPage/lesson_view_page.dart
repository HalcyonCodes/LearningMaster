import "package:flutter/material.dart";
import '../../config/index.dart';
import './components/nav/nav.dart';
import './components/class_list/future_class_list.dart';
import './components/lesson_list/future_lesson_list.dart';
//viewModel
import './model/view_model/class_list_viewmodel.dart';
import './model/view_model/lesson_list_viewmodel.dart';
//util
import './pageUtil/page_util.dart';

class LessonViewPage extends StatefulWidget {
  //classList部分
  final String? classListSearchString;
  final String? classListClassId;
  final String? classListPage;
  //lessonList部分
  final String? lessonListSearchString;
  final String? lessonListLessonId;
  final String? lessonListPage;

  const LessonViewPage(
      {super.key,
      this.classListClassId,
      this.classListPage,
      this.classListSearchString,
      this.lessonListLessonId,
      this.lessonListPage,
      this.lessonListSearchString
      
      });

  @override
  State<LessonViewPage> createState() => _LessonViewPageState();
}

class _LessonViewPageState extends State<LessonViewPage> {
  late String? classListSearchString;
  late String? classListClassId;
  late String? classListPage;
  late String? lessonListSearchString;
  late String? lessonListLessonId;
  late String? lessonListPage;


  //pageUtil
  LessonViewPageUtil pageUtil = LessonViewPageUtil();
  //viewModel
  late ClassListViewModel classListViewModel;
  late LessonListViewModel lessonListViewModel;

  @override
  void initState() {
    super.initState();
    //初始化
    classListClassId = widget.classListClassId;
    classListPage = widget.classListPage;
    classListSearchString = widget.classListSearchString;
    lessonListLessonId = widget.lessonListLessonId;
    lessonListPage = widget.lessonListPage;
    lessonListSearchString = widget.lessonListSearchString;

    classListViewModel = ClassListViewModel(pageUtil: pageUtil);
    lessonListViewModel = LessonListViewModel(pageUtil: pageUtil);
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
                    ),
                  ),
                  //课时
                  Container(
                    margin: const EdgeInsets.only(left: 24),
                    child: LessonListFuture(
                      pageUtil: pageUtil,
                      lessonPage: lessonListPage,
                      lessonId: lessonListLessonId,
                      searchString: lessonListSearchString,
                      viewModel: lessonListViewModel,
                    )
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
