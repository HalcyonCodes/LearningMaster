import 'package:double_bladed_axe/double_bladed_axe.dart';
import 'package:flutter/material.dart';
import './search_class_conbination_list/search_class_conbination_list.dart';
import '../../model/view_model/class_conbination_viewmodel.dart';
import '../../util_class_conbination_page/page_util.dart';
import './list_class_conbination_list/future_list_class_conbination_list.dart';

class ClassConbinationList extends StatelessWidget {
  
  final ListUtil listUtil = ListUtil();
  final ClassConbinationListViewModel viewModel;
  final String? initSearchString;
  final ClassConbinationPageUtil pageUtil;
  final String? conbinationId;

  ClassConbinationList({
    super.key,
    required this.viewModel,
    required this.pageUtil,
    this.initSearchString,
    this.conbinationId
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 * 2,
      width: MediaQuery.of(context).size.width >= 1920
          ? ((MediaQuery.of(context).size.width - 24) / 24) * 6 - 24
          : (1920 - 24) / 24 * 6 - 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClassConbinationSearch(initSearchString: initSearchString),
          const SizedBox(
            height: 12,
          ),
          ClassConbinationCardListFuture(
            listUtil: listUtil,
            viewModel: viewModel,
            pageUtil: pageUtil,
            searchString: initSearchString,
            conbinationId: conbinationId,
          )
        ],
      ),
    );
  }
}
