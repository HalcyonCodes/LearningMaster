import 'package:flutter/material.dart';
import '../util_lesson_list/util_lesson_list.dart';
import '../page_temp_lesson_list.dart/page_temp_lesson_list.dart';


import '../status_card_lesson_list/loadmore_ticker_animated_status_card_lesson_list.dart';
import '../status_card_lesson_list/loadpre_ticker_animated_status_card_lesson_list.dart';


import '../util_lesson_list/status_util_lesson_list.dart';

//在两个滚动条之间切换滚动条并记录翻页组件
//主要任务是在Listview和singlechildScrollView之间切换和获取新添加的页面在滚动条的高度信息

class SwitchList extends StatefulWidget {
  final LessonListUtil lessonListUtil;
  final List<Widget> initListItems;
  const SwitchList({super.key, required this.lessonListUtil, required this.initListItems});

  @override
  State<SwitchList> createState() => _SwitchListState();
}

class _SwitchListState<T> extends State<SwitchList> {

  late ScrollController scrollController;
  late bool isListView; //切换列表状态指示器
  late bool isLockScroll; //是否锁住列表滚动
  late Widget? singleChildScrollViewItemTemp; //添加用于计算长度的元件

  List<Widget> listViewItems = []; //用于显示的列表Items
  List<Widget> singleChildScrollViewItems = []; //用于计算的列表Items
  List<Widget> widgetsTemp = [];  //用于存放上一层http请求后得到的组件

  @override
  void initState()  {
    super.initState();
    isListView = true;
    isLockScroll = false;
    scrollControllerInit();
    addListViewItemOnFoot(widget.initListItems); //初始化列表元件
    singleChildScrollViewItemTemp = PageTemp(
      pageWidgets: widget.initListItems, 
      lessonListUtil: widget.lessonListUtil);//初始化用于计算长度的元件
    addSingleChildScrollViewItemOnFoot(singleChildScrollViewItemTemp); //添加到SingleChildScrollViewItem列表里，用于切换显示然后计算长度
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isListView ?
      ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: ListView(
          physics: isLockScroll ? const NeverScrollableScrollPhysics() : const ClampingScrollPhysics(),
          shrinkWrap: true,
          controller: scrollController,
          children: listViewItems,
        ),
      ):
      ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
        child: SingleChildScrollView(
          controller: scrollController, 
          physics: isLockScroll? const NeverScrollableScrollPhysics() : const ClampingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: singleChildScrollViewItems
          ),
        ),
      )
      ,
    );
  }

   void refreshUi()async{
    setState(() {});
  }

  void setIsListView(bool b) async{
    isListView = b;
  }

  //在ListViewItem头部添加元件
  void addListViewItemOnHead(List<Widget> items){
     listViewItems.insertAll(0, items);
  }
  

  //在ListViewItem尾部添加元件
  void addListViewItemOnFoot(items){
    listViewItems.addAll(items);
  }

  //在SingleChildScrollView头部添加元件
  void addSingleChildScrollViewItemOnHead(item){
    singleChildScrollViewItems.insert(0, item);
  }

  //在SingleChildScrollVIew尾部添加元件
  void addSingleChildScrollViewItemOnFoot(item){
    singleChildScrollViewItems.add(item);
  }


  //在ListViewItem头部删除元件
  void removeListViewItemOnHead(int startIndex, int endIndex){

  }
  
  //在ListViewItem尾部删除元件
  void removeListViewItemOnFoot(int startIndex, int endIndex){

  }

  //在SingleChildScrollView头部删除元件
  void removeSingleChildScrollViewItemOnHead(){
  }


  //在SingleChildScrollVIew尾部删除元件
  void removeSingleChildScrollViewItemOnFoot(){
  }


  //在SingleChildScrollView头部添加加载进度指示器
  void addLoadPreStatusCardOnHead(){
    listViewItems.insert(0, LoadPreStatusAnimatedTicker(lessonListUtil: widget.lessonListUtil));
  }

  //在SingleChildScrollView尾部添加加载进度指示器
  void addLoadMoreStatusCardOnFoot(){
    listViewItems.add(LoadMoreStatusAnimatedTicker(lessonListUtil: widget.lessonListUtil));
  }

  //在SingleChildScrollView头部移除加载进度指示器
  void removeLoadPreStatusCardOnHead(){
    listViewItems.removeAt(0);
  }

  //在SingleChildScrollView尾部移除加载进度指示器
  void removeLoadMoreStatusCardOnFoot(){
    listViewItems.removeLast();
  }

  //监控滚动条
  void scrollLisener(){
    
    scrollController.addListener(() async{
      //滚动条的最大值超过页面的高度
      if(scrollController.position.maxScrollExtent != 0 && scrollController.position.minScrollExtent == 0){
   
        //判断是否可以拖动
        if(widget.lessonListUtil.status == Status.statusIdel){
          
          //下拉判断
        if(scrollController.position.pixels == scrollController.position.minScrollExtent){
            widgetsTemp = [];
            singleChildScrollViewItemTemp = null;
            widget.lessonListUtil.setStatus(Status.statusHeadLoading); //设置状态为非空闲
            setIsListView(true); //切换到
            addLoadPreStatusCardOnHead(); //在尾部添加加载指示器
            //rebuildScrollCrtlLoadMoreBefore(); //从新构建滚scrollController

            refreshUi(); //切换成SinglechiScrollView
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
                  widget.lessonListUtil.startLoadPreStatusCardAniamte!(
                      () async {
                    try {
                      widgetsTemp = await widget.lessonListUtil.getLoadMoreWidgets!; //http请求并组装组件
                      //反向播放动画
                      await widget.lessonListUtil.reversetLoadMoreStatusCardAniamte!((){
                        removeLoadMoreStatusCardOnFoot();
                        
                        singleChildScrollViewItemTemp = PageTemp(
                            pageWidgets: widget.initListItems,
                            lessonListUtil: widget.lessonListUtil);
                        addSingleChildScrollViewItemOnFoot(singleChildScrollViewItemTemp); //添加Item
                        rebuildScrollCrtlLoadMoreBefore();
                        setIsListView(false);
                        refreshUi(); //刷新ui
                        
                        WidgetsBinding.instance.addPostFrameCallback((timeStamp){
                          //计算页面高度
                          print(listViewItems.length);
                          widget.lessonListUtil.loadMoreMathPageSign!();
                          addListViewItemOnFoot(widgetsTemp);
                          //设置成listview
                          setIsListView(true);
                          rebuildScrollCrtlLoadMoreAfter();
                          refreshUi();
                          widget.lessonListUtil.setStatus(Status.statusIdel);
                      
                            
                        });
                      }); 

                    } catch (e) {
                      widget.lessonListUtil.setStatus(Status.statusFootLoadFaild); //设置状态
                      singleChildScrollViewItemTemp = null; //
                      widgetsTemp = [];
                      await widget.lessonListUtil.reversetLoadMoreStatusCardAniamte!(() {
                        removeLoadMoreStatusCardOnFoot();
                        rebuildScrollCrtlLoadMoreAfter();
                        setIsListView(true);
                        refreshUi();
                        widget.lessonListUtil.setStatus(Status.statusIdel);
                      });
                    }
                  });
            });
          
          }
          
          //上拉判断
          if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent) {
            widgetsTemp = [];
            singleChildScrollViewItemTemp = null;
            widget.lessonListUtil.setStatus(Status.statusFootLoading); //设置状态为非空闲
            setIsListView(true); //切换到
            addLoadMoreStatusCardOnFoot(); //在尾部添加加载指示器
            rebuildScrollCrtlLoadMoreBefore(); //从新构建滚scrollController
            refreshUi(); //切换成SinglechiScrollView
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
                  widget.lessonListUtil.startLoadMoreStatusCardAniamte!(
                      () async {
                    try {
                      widgetsTemp = await widget.lessonListUtil.getLoadMoreWidgets!; //http请求并组装组件
                      //反向播放动画
                      await widget.lessonListUtil.reversetLoadMoreStatusCardAniamte!((){
                        removeLoadMoreStatusCardOnFoot();
                        
                        singleChildScrollViewItemTemp = PageTemp(
                            pageWidgets: widget.initListItems,
                            lessonListUtil: widget.lessonListUtil);
                        addSingleChildScrollViewItemOnFoot(singleChildScrollViewItemTemp); //添加Item
                        rebuildScrollCrtlLoadMoreBefore();
                        setIsListView(false);
                        refreshUi(); //刷新ui
                        
                        WidgetsBinding.instance.addPostFrameCallback((timeStamp){
                          //计算页面高度
                          print(listViewItems.length);
                          widget.lessonListUtil.loadMoreMathPageSign!();
                          addListViewItemOnFoot(widgetsTemp);
                          //设置成listview
                          setIsListView(true);
                          rebuildScrollCrtlLoadMoreAfter();
                          refreshUi();
                          widget.lessonListUtil.setStatus(Status.statusIdel);
                      
                            
                        });
                      }); 

                    } catch (e) {
                      widget.lessonListUtil.setStatus(Status.statusFootLoadFaild); //设置状态
                      singleChildScrollViewItemTemp = null; //
                      widgetsTemp = [];
                      await widget.lessonListUtil.reversetLoadMoreStatusCardAniamte!(() {
                        removeLoadMoreStatusCardOnFoot();
                        rebuildScrollCrtlLoadMoreAfter();
                        setIsListView(true);
                        refreshUi();
                        widget.lessonListUtil.setStatus(Status.statusIdel);
                      });
                    }
                  });
            });
          }
        }
      }
    });
  }
  
  //上拉加载请求，用于调用viewModel的http请求和构造widgets
  void loadPre(){
    
  }



  //初始化scrollController
  void scrollControllerInit(){
    scrollController = ScrollController(initialScrollOffset: 2);
    widget.lessonListUtil.setScrollController(scrollController);
    scrollLisener();
  }

  //加载完成后最后一步切换成listview用的scrollerController
  void rebuildScrollCrtlLoadMoreAfter(){
    double currentPixel = scrollController.position.pixels;
    scrollController = ScrollController(initialScrollOffset: currentPixel);
    widget.lessonListUtil.setScrollController(scrollController);
    scrollLisener();
  }
  
  //加载更多时第一次切换成singleChildScrollView所用的scrollCOntroller
  void rebuildScrollCrtlLoadMoreBefore(){
    double currentPixel = scrollController.position.pixels;
    scrollController = ScrollController(initialScrollOffset: currentPixel);
    widget.lessonListUtil.setScrollController(scrollController);
  }


  //加载上一个时第一次切换


}