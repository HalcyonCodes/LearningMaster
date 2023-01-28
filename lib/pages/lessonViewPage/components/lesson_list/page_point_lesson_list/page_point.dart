import 'package:flutter/material.dart';
import 'package:learning_master/config/index.dart';
import 'package:double_bladed_axe/double_bladed_axe.dart';

//页面的页数指示器
class PagePoint extends StatefulWidget {
  final ListUtil lessonListUtil;
  final String currentPage;
  final String maxPage;
  const PagePoint(
      {super.key,
      required this.lessonListUtil,
      required this.currentPage,
      required this.maxPage});

  @override
  State<PagePoint> createState() => _PagePointState();
}

class _PagePointState extends State<PagePoint> {
  late int currentPage;
  late int maxPage;
  // PageChange pageChange = PageChange();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = int.tryParse(widget.currentPage)!;
    maxPage = int.tryParse(widget.maxPage)!;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
        int page = widget.lessonListUtil.getCurrentPageInFunctionList!();
        //print("$page");
        if (currentPage == page) {
        } else {
          currentPage = page;
          refresh();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 17,
      child: Text(
        '第 $currentPage / $maxPage 页',
        style: KFont.pagePoint,
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
