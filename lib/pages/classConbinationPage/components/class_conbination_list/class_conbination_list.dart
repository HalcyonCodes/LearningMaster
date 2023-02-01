import 'package:double_bladed_axe/double_bladed_axe.dart';
import 'package:flutter/material.dart';
import 'package:learning_master/pages/classConbinationPage/components/class_conbination_list/list_class_conbination_list/class_conbination_list.dart';
import './search_class_conbination_list/search_class_conbination_list.dart';
import '../../model/view_model/class_conbination_viewmodel.dart';
import '../../util_class_conbination_page/page_util.dart';
class ClassConbinationList extends StatelessWidget {
  final String initPage;
  final String maxPage;
  final String pageMaxContainerCount;
  final ListUtil listUtil = ListUtil();
  final ClassConbinationListViewModel viewModel;
  final String? initSearchString;
  final ClassConbinationPageUtil pageUtil;

  ClassConbinationList({
    super.key,
    required this.initPage,
    required this.maxPage,
    required this.pageMaxContainerCount,
    required this.viewModel,
    required this.pageUtil,
    this.initSearchString,
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
          ClasssConbinationCardList(
            height:  MediaQuery.of(context).size.height - 12 - 46 - 48,
            initPage: initPage,
            maxPage: maxPage,
            pageMaxContainCount: pageMaxContainerCount,
            listUtil: listUtil,
            viewModel: viewModel,
            pageUtil: pageUtil,
          )
        ],
      ),
    );
  }
}
