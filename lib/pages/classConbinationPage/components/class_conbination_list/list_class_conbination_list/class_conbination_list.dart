import 'package:flutter/material.dart';
import 'package:double_bladed_axe/double_bladed_axe.dart';
import '../../status_card/user_loadmore_widget.dart';
import '../../status_card/user_loadpre_widget.dart';
import '../card_class_conbination_list/card_class_conbination_list.dart';

//课程组合卡片容器,将viewmodel的数据包装成cards
class ClasssConbinationCardList extends StatefulWidget {
  final double height;
  final String initPage;
  final String maxPage;
  final String pageMaxContainCount;
  final ListUtil listUtil;

  const ClasssConbinationCardList({
    super.key,
    required this.height,
    required this.initPage,
    required this.maxPage,
    required this.pageMaxContainCount,
    required this.listUtil,
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
  //late List<Widget> widgetsTemp;

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
    initWidgets = List.generate(10, (index) {
      return const ClassConbiantionCard(
        conbinationId: 'B001',
        classCount: '15',
        conbinationTitle: '全栈技术开发',
        difficultyLevel: '8.5',
        lengthLevel: '8.5',
        usabilityLevel: '8.5',
      );
    });
  }    

  Future<List<Widget>> loadMoreWidgets() async {
    List<Widget> widgetsTemp = [];
    widgetsTemp = List.generate(3, (index) {
      return const ClassConbiantionCard(
        conbinationId: 'B001',
        classCount: '15',
        conbinationTitle: '游戏逆向安全',
        difficultyLevel: '8.5',
        lengthLevel: '8.5',
        usabilityLevel: '8.5',
      );
    });
    return widgetsTemp;
  }

  Future<List<Widget>> loadPreWIdgets() async {
    List<Widget> widgetsTemp = [];
    widgetsTemp = List.generate(3, (index) {
      return const ClassConbiantionCard(
        conbinationId: 'B001',
        classCount: '15',
        conbinationTitle: '嵌入式开发',
        difficultyLevel: '8.5',
        lengthLevel: '8.5',
        usabilityLevel: '8.5',
      );
    });
    return widgetsTemp;
  }
}
