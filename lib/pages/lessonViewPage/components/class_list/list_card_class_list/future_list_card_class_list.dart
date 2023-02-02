import 'package:flutter/material.dart';
import './list_card_class_list.dart';
import '../../../model/view_model/class_list_viewmodel.dart';
import 'package:double_bladed_axe/double_bladed_axe.dart';
import '../../../pageUtil/page_util.dart';

class ClassCardListFuture extends StatefulWidget {
  final String? classId;
  final ListUtil listUtil;
  final LessonViewPageUtil pageUtil;
  final ClassListViewModel viewModel;
  final String? searchString;

  const ClassCardListFuture({
    super.key,
    this.classId,
    this.searchString,
    required this.listUtil,
    required this.pageUtil,
    required this.viewModel,
  });

  @override
  State<ClassCardListFuture> createState() => _ClassCardListFutureState();
}

class _ClassCardListFutureState extends State<ClassCardListFuture> {
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
              return ClassCardList(
                listUtil: widget.listUtil,
                pageUtil: widget.pageUtil,
                viewModel: widget.viewModel,
                initPage: widget.viewModel.initPage,
                maxPage: widget.viewModel.maxPage,
                pageMaxContainCount: widget.viewModel.maxPageContainerCount,
                searchString: searchString,
              );
            }
        }
      }),
    );
  }
}
