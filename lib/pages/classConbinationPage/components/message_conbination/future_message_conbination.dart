import 'package:flutter/material.dart';
import 'package:learning_master/pages/classConbinationPage/components/message_conbination/message_conbination.dart';
import '../../model/view_model/message_conbination_viewmodel.dart';
import '../../util_class_conbination_page/page_util.dart';

class ConbinationMessageFuture extends StatefulWidget {
  final String? conbinationId;
  final ConbinationMessageViewModel viewModel;
  final ClassConbinationPageUtil pageUtil;
  const ConbinationMessageFuture({
    super.key,
    required this.conbinationId,
    required this.viewModel,
    required this.pageUtil,
  });
  @override
  State<ConbinationMessageFuture> createState() =>
      _ConbinationMessageFutureState();
}

class _ConbinationMessageFutureState extends State<ConbinationMessageFuture> {
  late String? conbinationId;
  late bool isDisplay;
  @override
  void initState() {
    super.initState();
    conbinationId = widget.conbinationId;
    isDisplay = true;
    //注册
    widget.pageUtil.setFuncSetDisplayInConbinationMessageFuture(setIsDiplay);
    widget.pageUtil.setFuncRefreshConbinationMessageFuture(refreshUi);
    widget.pageUtil.setFuncSetConbinationIdNullInConbinationMessageFuture(initConbinationId);
  }

  @override
  Widget build(BuildContext context) {
    return !isDisplay
        ? Container()
        : FutureBuilder(
            future: widget.viewModel.refresh(conbinationId),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                  return const Text('none');

                case ConnectionState.waiting:
                  return const Text('waiting');

                case ConnectionState.active:
                  return const Text('active');

                case ConnectionState.done:
                  if (snapshot.hasError) {
                    return const Text('erro');
                  } else {
                    return ConbinationMessage(
                      viewModel: widget.viewModel,
                      pageUtil: widget.pageUtil,
                    );
                  }
              }
            });
  }

  void setIsDiplay(bool b) {
    isDisplay = b;
  }

  void refreshUi() {
    setState(() {});
  }

  void initConbinationId() {
    conbinationId = null;
  }
}
