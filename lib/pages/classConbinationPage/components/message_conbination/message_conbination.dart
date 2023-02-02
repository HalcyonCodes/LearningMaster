import 'package:flutter/material.dart';

import 'conbination_profile_message_conbination/proflile_conbination_message_conbination.dart';
import './card_list_message_conbination/card_list_message_conbination.dart';
import '../../model/view_model/message_conbination_viewmodel.dart';
import '../../util_class_conbination_page/page_util.dart';

class ConbinationMessage extends StatelessWidget {
  final ConbinationMessageViewModel viewModel;
  final ClassConbinationPageUtil pageUtil;
  const ConbinationMessage({
    super.key,
    required this.viewModel,
    required this.pageUtil,  
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 * 2,
      width: MediaQuery.of(context).size.width >= 1920
          ? ((MediaQuery.of(context).size.width - 24) / 24) * 10 - 24
          : (1920 - 24) / 24 * 10 - 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          ConbinationProfile(
            profile: viewModel.conbinationMessageModel!.data.conbinationProfile,
          ),
          const SizedBox(
            height: 24,
          ),
          ConbinationMessageClassList(
            pageUtil: pageUtil,
            viewModel: viewModel,
          ),
        ],
      ),
    );
  }
}
