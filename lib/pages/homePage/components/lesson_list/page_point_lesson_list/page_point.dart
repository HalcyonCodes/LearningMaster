

import 'package:flutter/material.dart';
import 'package:learning_master/config/index.dart';


//页面的页数指示器
class PagePoint extends StatefulWidget {
  final String currentPage;
  final String pages;
  const PagePoint({super.key,required this.currentPage, required this.pages});

  @override
  State<PagePoint> createState() => _PagePointState();
}

class _PagePointState extends State<PagePoint> {

  late String currentPage;
  late String pages;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentPage = widget.currentPage;
    pages = widget.pages;
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 17,
      child: Text('第 $currentPage / $pages 页', style: KFont.pagePoint,),
    );
  }

  void refresh(){
    setState(() {
    });
  }
}