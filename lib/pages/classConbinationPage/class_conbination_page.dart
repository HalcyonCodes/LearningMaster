import "package:flutter/material.dart";
import '../../config/index.dart';
import './components/nav/nav.dart';
import './components/class_conbination_list/class_conbination_list.dart';
import './components/class_profile_conbination/future_class_profile_conbination.dart';
import './util_class_conbination_page/page_util.dart';
import './model/view_model/class_conbination_viewmodel.dart';
import './model/view_model/message_conbination_viewmodel.dart';
import './components/message_conbination/future_message_conbination.dart';
import './model/view_model/class_profile_viewmodel.dart';

class ClassConbinationPage extends StatefulWidget {
  final String? conbinationId;
  final String? classId;
  final String? conbinationSearchString;

  const ClassConbinationPage({
    super.key,
    this.conbinationId,
    this.classId,
    this.conbinationSearchString,
  });

  @override
  State<ClassConbinationPage> createState() => _ClassConbinationPageState();
}

class _ClassConbinationPageState extends State<ClassConbinationPage> {
  ClassConbinationPageUtil pageUtil = ClassConbinationPageUtil();
  late ClassConbinationListViewModel classConbinationListViewModel;
  late ConbinationMessageViewModel conbinationMessageViewModel;
  late ClassProfileViewModel classProfileViewModel;
  //--
  late String? conbinationId;
  late String? classId;
  late String? conbinationSearchString;
  //--
  @override
  void initState() {
    super.initState();
    conbinationId = widget.conbinationId;
    classId = widget.classId;
    conbinationSearchString = widget.conbinationSearchString;
    //--
    classConbinationListViewModel =
        ClassConbinationListViewModel(pageUtil: pageUtil);
    conbinationMessageViewModel =
        ConbinationMessageViewModel(pageUtil: pageUtil);
    classProfileViewModel = ClassProfileViewModel(pageUtil: pageUtil);
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
                    currentIndex: 1,
                    userName: 'reddock',
                  ),
                  //课程组合列表
                  Container(
                      height: MediaQuery.of(context).size.height - 24 * 2,
                      width: MediaQuery.of(context).size.width >= 1920
                          ? ((MediaQuery.of(context).size.width - 24) / 24) *
                                  6 -
                              24
                          : (1920 - 24) / 24 * 6 - 24,
                      margin: const EdgeInsets.only(left: 24),
                      child: ClassConbinationList(
                        viewModel: classConbinationListViewModel,
                        pageUtil: pageUtil,
                        initSearchString: conbinationSearchString,
                        conbinationId: conbinationId,
                      )),
                  Container(
                      height: MediaQuery.of(context).size.height - 24 * 2,
                      width: MediaQuery.of(context).size.width >= 1920
                          ? ((MediaQuery.of(context).size.width - 24) / 24) *
                                  10 -
                              24
                          : (1920 - 24) / 24 * 10 - 24,
                      margin: const EdgeInsets.only(left: 24),
                      child: ConbinationMessageFuture(
                        conbinationId: conbinationId,
                        viewModel: conbinationMessageViewModel,
                        pageUtil: pageUtil,
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width >= 1920
                          ? ((MediaQuery.of(context).size.width - 24) / 24) *
                                  5 -
                              24
                          : (1920 - 24) / 24 * 5 - 24,
                      margin: const EdgeInsets.only(left: 24),
                      child: ClassProfileFuture(
                        pageUtil: pageUtil,
                        viewModel: classProfileViewModel,
                        classId: classId,
                        conbinationId: conbinationId,
                      ))

                  //课时
                ]),
          ),
        ),
      ),
    );
  }
}
