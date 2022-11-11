import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../util_lesson_list/util_lesson_list.dart';
import './animated_status_card_lesson_list.dart';


//封装加载更多的指示器动画
class LoadMoreStatusAnimatedTicker extends StatefulWidget{

  final LessonListUtil lessonListUtil;
  const LoadMoreStatusAnimatedTicker({super.key, required this.lessonListUtil});

  @override
  State<LoadMoreStatusAnimatedTicker> createState() => _LoadMoreStatusAnimatedTickerState();
}

class _LoadMoreStatusAnimatedTickerState extends State<LoadMoreStatusAnimatedTicker> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin{

  late AnimationController animationController;


  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    widget.lessonListUtil.setStartLoadMoreStatusCardAnimate(startAnimate);
    widget.lessonListUtil.setReverseLoadMoreStatusCardAnimate(reverseAnimate);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedStatusCard(
      animationController: animationController, 
      animation: Tween<double>(begin: 0.0, end:  1.0).animate(
        CurvedAnimation(
          parent: animationController,
          curve: const Interval((1 / 3) * 0, 1.0,
             curve: Curves.fastOutSlowIn
          )
        )
      ), 
      statusString: widget.lessonListUtil.statusText);
  }

  Future<void> startAnimate(Function() func) async{
    if(animationController.status != AnimationStatus.completed){
      refreshUi();
      await animationController.forward().then((value) {func();});
    }
    
  }

  Future<void> reverseAnimate( Function() func) async{
    if(animationController.status == AnimationStatus.completed){
      refreshUi();
      await animationController.reverse().then((value) {func();});
    }
  }

  void refreshUi(){
    setState(() {
      
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  
  @override
  bool get wantKeepAlive => true;

}