import 'package:double_bladed_axe/double_bladed_axe.dart';
import 'package:flutter/material.dart';
import 'package:learning_master/pages/classConbinationPage/components/class_conbination_list/list_class_conbination_list/class_conbination_list.dart';
import './search_class_conbination_list/search_class_conbination_list.dart';

class ClassConbinationList extends StatelessWidget {
  final double height;
  final String initPage;
  final String maxPage;
  final String pageMaxContainerCount;
  final ListUtil listUtil = ListUtil();
  final String? initSearchString;

  ClassConbinationList({
    super.key,
    required this.height,
    required this.initPage,
    required this.maxPage,
    required this.pageMaxContainerCount,
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
            height: height - 12 - 46 - 48,
            
            initPage: initPage,
            maxPage: maxPage,
            pageMaxContainCount: pageMaxContainerCount,
            listUtil: listUtil,
          )
        ],
      ),
    );
  }
}
