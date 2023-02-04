import 'dart:math';

import 'package:flutter/material.dart';
import 'user_list_lesson_list';
import '../../../model/view_model/lesson_list_viewmodel.dart';
import '../../../pageUtil/page_util.dart';
import 'package:double_bladed_axe/double_bladed_axe.dart';
import 'page_point.dart';

class UserListFuture extends StatefulWidget {
  final LessonListViewModel viewModel;
  final LessonViewPageUtil pageUtil;
  final String? lessonId;
  final String? classId;
  final String? searchString;
  //final ListUtil listUtil;

  const UserListFuture({
    super.key,
    required this.pageUtil,
    required this.viewModel,
    //required this.listUtil,
    this.classId,
    this.lessonId,
    this.searchString,
  });

  @override
  State<UserListFuture> createState() => _UserListFutureState();
}

class _UserListFutureState extends State<UserListFuture> {
  late String? classId;
  late String? lessonId;
  late String? searchString;

  late ListUtil listUtil;

  @override
  void initState() {
    super.initState();
    classId = widget.classId;
    lessonId = widget.lessonId;
    searchString = widget.searchString;
    listUtil = ListUtil();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.viewModel.refresh(classId, lessonId, searchString),
      builder: ((context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('none');

          case ConnectionState.waiting:
            return const Text('waiting');

          case ConnectionState.active:
            return const Text('active');

          case ConnectionState.done:
            if (snapshot.hasError) {
              return const Text('error');
            } else {
              //listUtil = ListUtil();
              return Column(children: [
                PagePoint(
                  pageutil: widget.pageUtil,
                  lessonListUtil: listUtil,
                ),
                const SizedBox(
                  height: 12,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height -
                      24 * 2 -
                      12 * 2 -
                      17 -
                      46,
                  child: UserList(
                      listUtil: listUtil,
                      initPage: widget.viewModel.initPage!,
                      pageMaxContainCount:
                          widget.viewModel.maxPageContainerCount!,
                      maxPage: widget.viewModel.maxPage!,
                      viewModel: widget.viewModel),
                ),
              ]);
            }
        }
      }),
    );
  }
}
