import 'package:flutter/material.dart';
import '../util_lesson_list/util_lesson_list.dart';
import '../switch_list_lesson_list/switch_list_lesson_list.dart';

//计算滚动条所在页面，调整滚动条长度, 裁剪列表元素数量
class FunctionList extends StatefulWidget {
  final List<Widget> initListItems;
  final LessonListUtil lessonListUtil;
  final int initPage;
  final int pagMaxContainCount; //页面的最大容量，过多时会删除头部或者尾部的item
  const FunctionList({super.key, required this.initListItems, required this.lessonListUtil, required this.initPage, required this.pagMaxContainCount});

  @override
  State<FunctionList> createState() => _FunctionListState();
}

class _FunctionListState extends State<FunctionList> {

  //标记滚动条中存放元素的列表在滚动条中的起始位置
  Map<int,double> pageSignStart = {};
  int currentPage = 0;
  int pageMaxContainCount = 0;

  @override
  void initState() {
    super.initState();
    //注册方法
    widget.lessonListUtil.setFuncGetCurrentPage(getCurrentPage);
    widget.lessonListUtil.setFuncLoadMoreMathPageSign(loadMoreMathPageSign);
    widget.lessonListUtil.setFuncLoadPreMathPageSign(loadPreMathPageSign);
    //初始化列表中所容纳的最大页面数量
    pageMaxContainCount = widget.pagMaxContainCount;
    currentPage = widget.initPage;
    //初始化页面高度标志
    pageSignStartInit();
    
  }

  @override
  Widget build(BuildContext context) {
    return SwitchList(lessonListUtil: widget.lessonListUtil, initListItems: widget.initListItems);
  }

  //初始化滚动高度
  void pageSignStartInit(){
     pageSignStart[widget.initPage] = 0.0;
     pageSignStart[widget.initPage + 1] = widget.lessonListUtil.screenHeight! + 9999;
  }


  //得到当前页面index
  int getCurrentPage(ScrollController scrollController){
    double currentScrollPixel = scrollController.position.pixels;
    int page= 0;
    pageSignStart.forEach((key, value) {
      if(pageSignStart[key] != null && pageSignStart[key + 1]!= null){

        if(currentScrollPixel >= pageSignStart[key]! && currentScrollPixel <= pageSignStart[key+1]!){
           page = key;
           return;
        }
      }
    });
    return page;
  }


  //加载更多时计算并添加元素页面高度
  Future<void> loadMoreMathPageSign() async{
    double widgetHeight = await widget.lessonListUtil.getSinglePageHeight!();
    //获得最大的页数
    int lastPage = 0;
    for(var key in pageSignStart.keys){
      if(key > lastPage){
        lastPage = key;
      }
    }
    pageSignStart[lastPage + 1] = pageSignStart[lastPage]!;
    pageSignStart[lastPage] = widgetHeight;
    
    //当超出设定的列表所能容纳的页面数量时在头部裁剪map
    int firstPage = 0xffffffff;
    if (pageMaxContainCount != 0) {
      if (pageSignStart.keys.length > pageMaxContainCount) {
        //寻找最小值
        for (var key in pageSignStart.keys) {
          if (firstPage > key) {
            firstPage = key;
          }
        }
      }
    }
    int space = (lastPage - firstPage) - pageMaxContainCount;
    for(int key = firstPage; key <= key + space; key++){
      pageSignStart.remove(key);
    }
  }

  //加载上一个时计算并添加元素高度
  Future<void> loadPreMathPageSign() async{
    double widgetHeight = await widget.lessonListUtil.getSinglePageHeight!();
    //获得最小页数
    int firstPage = 0xffffffff;
    for(var key in pageSignStart.keys){
      if(firstPage > key){
        firstPage = key;
      }
    }
    //替换位置
    for(var key in pageSignStart.keys){
      pageSignStart[key + 1] = pageSignStart[key]!;
    }
    //插入
    pageSignStart[firstPage] = widgetHeight;
    
    //当超出设定的列表所能容纳的页面数量时在脚部移除元素
    int lastPage = 0;
    if (pageMaxContainCount != 0) {
      if (pageSignStart.keys.length > pageMaxContainCount) {
        //获得最大的页数
        for (var key in pageSignStart.keys) {
          if (key > lastPage) {
            lastPage = key;
          }
        }
      }
    }
    int space = (lastPage - firstPage) - pageMaxContainCount;
    for(int key = lastPage ; key<= lastPage - space ; key--){
      pageSignStart.remove(key);
    }
  }

  //对滚动条进行跳转
  void setScrollCrtl(double pixels){
    widget.lessonListUtil.scrollController!.position.setPixels(pixels);
  }



}