import "package:flutter/material.dart";
import 'package:learning_master/pages/classConbinationPage/components/message_conbination/message_conbination.dart';
import '../../config/index.dart';
import './components/nav/nav.dart';
import './components/class_conbination_list/future_class_conbination_list.dart';
import './components/class_profile_conbination/class_profile_conbination.dart';
import './util_class_conbination_page/page_util.dart';
import './model/view_model/class_conbination_viewmodel.dart';

class ClassConbinationPage extends StatefulWidget {
  const ClassConbinationPage({super.key});

  @override
  State<ClassConbinationPage> createState() => _ClassConbinationPageState();
}

class _ClassConbinationPageState extends State<ClassConbinationPage> {
  ClassConbinationPageUtil pageUtil = ClassConbinationPageUtil();
  late ClassConbinationListViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = ClassConbinationListViewModel(pageUtil: pageUtil);
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
                    margin: const EdgeInsets.only(left: 24),
                    child: ClassConbinationListFuture(
                      viewModel: viewModel,
                      pageUtil: pageUtil,
                      conbinationId: null,
                      searchString: null,
                    ),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 24),
                      child: ConbinationMessage()),
                  Container(
                    margin: const EdgeInsets.only(left: 24),
                    child: ClassProfile(classProfile: 'C++作为一门基础语言必须掌握'),
                  )

                  //课时
                ]),
          ),
        ),
      ),
    );
  }
}
