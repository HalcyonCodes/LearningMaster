import 'package:flutter/material.dart';
import 'package:double_bladed_axe/double_bladed_axe.dart';
import '../../status_card/user_loadmore_widget.dart';
import '../../status_card/user_loadpre_widget.dart';
import '../card_class_conbination_list/card_class_conbination_list.dart';
import '../../../model/view_model/class_conbination_viewmodel.dart';
import '../../../util_class_conbination_page/page_util.dart';

//课程组合卡片容器,将viewmodel的数据包装成cards
class ClasssConbinationCardList extends StatefulWidget {
  final double height;
  final String initPage;
  final String maxPage;
  final String pageMaxContainCount;
  final ListUtil listUtil;
  final ClassConbinationPageUtil pageUtil;
  final ClassConbinationListViewModel viewModel;

  const ClasssConbinationCardList({
    super.key,
    required this.height,
    required this.initPage,
    required this.maxPage,
    required this.pageMaxContainCount,
    required this.listUtil,
    required this.viewModel,
    required this.pageUtil,
  });

  @override
  State<ClasssConbinationCardList> createState() =>
      _ClasssConbinationCardListState();
}

class _ClasssConbinationCardListState extends State<ClasssConbinationCardList> {
  late double height;
  late String initPage;
  late String maxPage;
  late String pageMaxContainCount;
  late List<Widget> initWidgets;
  late List<Widget> widgetsTemp;

  @override
  void initState() {
    super.initState();
    //初始化
    height = widget.height;
    initPage = widget.initPage;
    maxPage = widget.maxPage;
    pageMaxContainCount = widget.pageMaxContainCount;
    initWidgets = [];
    //widgetsTemp = [];
    initWidget();
    //注册
    widget.listUtil.setFuncGetLoadPreWidgets(loadPreWIdgets);
    widget.listUtil.setFuncGetLoadMoreWidgets(loadMoreWidgets);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.height,
      child: DoubleBladedAxe(
        loadMoreStatusWidget: UserLoadMoreWidget(
          listUtil: widget.listUtil,
        ),
        loadPreStatusWidget: UserLoadPreWidget(listUtil: widget.listUtil),
        initWidgets: initWidgets,
        initPage: initPage,
        maxPage: maxPage,
        pageMaxContainCount: pageMaxContainCount,
        listUtil: widget.listUtil,
      ),
    );
  }

  void initWidget() {
    initWidgets = [];
    initWidgets = List.generate(
        widget.viewModel.classConbinationModel!.data.conbinationCards.length,
        (index) {
      return ClassConbiantionCard(
        conbinationId: widget.viewModel.classConbinationModel!.data
            .conbinationCards[index].conbinationId!,
        classCount: widget.viewModel.classConbinationModel!.data
            .conbinationCards[index].classCount!,
        conbinationTitle: widget.viewModel.classConbinationModel!.data
            .conbinationCards[index].conbinationTitle!,
        difficultyLevel: widget.viewModel.classConbinationModel!.data
            .conbinationCards[index].difficultyLevel!,
        lengthLevel: widget.viewModel.classConbinationModel!.data
            .conbinationCards[index].lengthLevel!,
        usabilityLevel: widget.viewModel.classConbinationModel!.data
            .conbinationCards[index].usabilityLevel!,
        onClick: () {},
      );
    });
  }

  Future<List<Widget>> loadMoreWidgets() async {
    List<Widget> widgetsTemp = [];
    int pageEndIndex = widget.listUtil.getPageEndIndex!();
    //请求
    widget.viewModel.loadMore(
      pageEndIndex, widget.viewModel.searchString,
    );

    widgetsTemp = List.generate(
        widget.viewModel.classConbinationModel!.data.conbinationCards.length,
        (index) {
      return ClassConbiantionCard(
        conbinationId: widget.viewModel.classConbinationModel!.data
            .conbinationCards[index].conbinationId!,
        classCount: widget.viewModel.classConbinationModel!.data
            .conbinationCards[index].classCount!,
        conbinationTitle: widget.viewModel.classConbinationModel!.data
            .conbinationCards[index].conbinationTitle!,
        difficultyLevel: widget.viewModel.classConbinationModel!.data
            .conbinationCards[index].difficultyLevel!,
        lengthLevel: widget.viewModel.classConbinationModel!.data
            .conbinationCards[index].lengthLevel!,
        usabilityLevel: widget.viewModel.classConbinationModel!.data
            .conbinationCards[index].usabilityLevel!,
        onClick: () {},
      );
    });
    return widgetsTemp;
  }

  Future<List<Widget>> loadPreWIdgets() async {
    List<Widget> widgetsTemp = [];
    int pageStartIndex = widget.listUtil.getPageStartIndex!();
    //请求
    widget.viewModel.loadPre(
      pageStartIndex, widget.viewModel.searchString,
    );

    widgetsTemp = List.generate(
        widget.viewModel.classConbinationModel!.data.conbinationCards.length,
        (index) {
      return ClassConbiantionCard(
        conbinationId: widget.viewModel.classConbinationModel!.data
            .conbinationCards[index].conbinationId!,
        classCount: widget.viewModel.classConbinationModel!.data
            .conbinationCards[index].classCount!,
        conbinationTitle: widget.viewModel.classConbinationModel!.data
            .conbinationCards[index].conbinationTitle!,
        difficultyLevel: widget.viewModel.classConbinationModel!.data
            .conbinationCards[index].difficultyLevel!,
        lengthLevel: widget.viewModel.classConbinationModel!.data
            .conbinationCards[index].lengthLevel!,
        usabilityLevel: widget.viewModel.classConbinationModel!.data
            .conbinationCards[index].usabilityLevel!,
        onClick: () {},
      );
    });
    return widgetsTemp;
  }


  //刷新

}
