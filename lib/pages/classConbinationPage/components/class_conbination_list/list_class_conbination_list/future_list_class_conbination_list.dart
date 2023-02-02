import 'package:flutter/material.dart';
import '../../../util_class_conbination_page/page_util.dart';
import '../../../model/view_model/class_conbination_viewmodel.dart';
import './class_conbination_list.dart';
import 'package:double_bladed_axe/double_bladed_axe.dart';

class ClassConbinationCardListFuture extends StatefulWidget {
  final String? conbinationId;
  final String? searchString;
  final ClassConbinationPageUtil pageUtil;
  final ListUtil listUtil;
  final ClassConbinationListViewModel viewModel;

  const ClassConbinationCardListFuture(
      {super.key,
      required this.pageUtil,
      required this.viewModel,
      required this.listUtil,
      this.conbinationId,
      this.searchString});

  @override
  State<ClassConbinationCardListFuture> createState() =>
      _ClassConbinationCardListFutureState();
}

class _ClassConbinationCardListFutureState
    extends State<ClassConbinationCardListFuture> {
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
              return ClassConbinationCardList(
                height: MediaQuery.of(context).size.height - 12 - 46 - 48,
                initPage: widget.viewModel.initPage!,
                maxPage: widget.viewModel.maxPage!,
                pageMaxContainCount: widget.viewModel.maxPageConbinationCount!,
                listUtil: widget.listUtil,
                viewModel: widget.viewModel,
                pageUtil: widget.pageUtil,
              );
          }
        }));
  }
}
