import 'package:flutter/material.dart';
import '../../pageUtil/page_util.dart';
import '../../model/view_model/class_list_viewmodel.dart';
import './class_list.dart';

class ClassListFuture extends StatefulWidget {
  final String? classId;
  final String? searchString;
  final LessonViewPageUtil pageUtil;
  final ClassListViewModel viewModel;
  const ClassListFuture(
      {super.key,
      this.searchString,
      this.classId,
      required this.pageUtil,
      required this.viewModel});
  @override
  State<ClassListFuture> createState() => _ClassListFutureState();
}

class _ClassListFutureState extends State<ClassListFuture> {
  late String? searchString;
  late String? classId;

  @override
  void initState() {
    super.initState();
    searchString = widget.searchString;
    classId = widget.classId;

  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.viewModel.refresh(classId, searchString),
      builder: ((context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('none');

          case ConnectionState.waiting:
            print('qqqxxxccc');
            return const Text('waiting');

          case ConnectionState.active:
            print('qqqqss');
            return const Text('active');

          case ConnectionState.done:
            if (snapshot.hasError) {
              return const Text('error');
            } else {
              print('qqq');
              return ClassList(
                  initString: searchString,
                  initPage: widget.viewModel.initPage,
                  maxPage: widget.viewModel.maxPage,
                  pageMaxContainerCount: widget.viewModel.pageMaxContainerCount,
                  pageUtil: widget.pageUtil,
                  viewModel: widget.viewModel);
            }
        }
      }),
    );
  }
}
