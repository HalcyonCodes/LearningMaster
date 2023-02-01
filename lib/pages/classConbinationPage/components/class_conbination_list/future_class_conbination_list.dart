import 'package:flutter/material.dart';
import '../../model/view_model/class_conbination_viewmodel.dart';
import '../../util_class_conbination_page/page_util.dart';
import './class_conbination_list.dart';

class ClassConbinationListFuture extends StatefulWidget {
  final String? conbinationId;
  final String? searchString;
  final ClassConbinationPageUtil pageUtil;
  final ClassConbinationListViewModel viewModel;

  const ClassConbinationListFuture({
    super.key,
    required this.viewModel,
    required this.pageUtil,
    this.conbinationId,
    this.searchString,
  });

  @override
  State<ClassConbinationListFuture> createState() => _ClassConbinationListFutureState();
}

class _ClassConbinationListFutureState extends State<ClassConbinationListFuture> {
  late String? conbinationId;
  late String? searchString;

  @override
  void initState() {
    super.initState();

    //初始化
    conbinationId = widget.conbinationId;
    searchString = widget.searchString;
    //注册
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.viewModel.refresh(conbinationId, searchString),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none');

            case ConnectionState.waiting:
              return Text('waiting');

            case ConnectionState.active:
              return Text('active');

            case ConnectionState.done:
              return ClassConbinationList(
                  initPage: widget.viewModel.initPage!,
                  maxPage: widget.viewModel.maxPage!,
                  pageMaxContainerCount:
                      widget.viewModel.maxPageConbinationCount!,
                  initSearchString: searchString,
                  pageUtil: widget.pageUtil,
                  viewModel: widget.viewModel,
                  );
          }
        }));
  }
}
