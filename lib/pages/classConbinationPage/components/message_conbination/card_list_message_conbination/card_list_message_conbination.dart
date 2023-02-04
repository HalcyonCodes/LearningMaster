import 'package:flutter/material.dart';
import 'card_message_conbination.dart';
import '../../../model/view_model/message_conbination_viewmodel.dart';
import '../../../util_class_conbination_page/page_util.dart';

//课程组合简介卡片列表
class ConbinationMessageClassList extends StatefulWidget {
  final ConbinationMessageViewModel viewModel;
  final ClassConbinationPageUtil pageUtil;
  const ConbinationMessageClassList({
    super.key,
    required this.viewModel,
    required this.pageUtil,
  });

  @override
  State<ConbinationMessageClassList> createState() =>
      _ConbinationMessageClassListState();
}

class _ConbinationMessageClassListState
    extends State<ConbinationMessageClassList> {
  late List<Widget> initWidgets;

  @override
  void initState() {
    super.initState();
    initWidgets = [];
    initWidget();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      children: initWidgets,
    );
  }

  void initWidget() {
    initWidgets = List.generate(
        widget.viewModel.conbinationMessageModel!.data.classCards.length,
        (index) {
      return ClassCard(
          classId: widget.viewModel.conbinationMessageModel!.data
              .classCards[index].classId,
          lastUpdateTime: widget.viewModel.conbinationMessageModel!.data
              .classCards[index].lastUpdateTime,
          classCount: widget.viewModel.conbinationMessageModel!.data
              .classCards[index].classCount,
          className: widget.viewModel.conbinationMessageModel!.data
              .classCards[index].className,
          classStatus: widget.viewModel.conbinationMessageModel!.data
              .classCards[index].classStatus,
          onClick: () {
            widget.pageUtil.setIsDisplayInClassProfileFuture!(true);
            widget.pageUtil.setRefreshParaNullInClassProfileFuture!();
            widget.pageUtil.setRefreshParaInClassProfileViewModel!(
                widget.viewModel.conbinationMessageModel!.data.conbinationId,
                widget.viewModel.conbinationMessageModel!.data.classCards[index]
                    .classId);

            widget.pageUtil.refreshUiInClassProfileFuture!();
          });
    });
  }
}
