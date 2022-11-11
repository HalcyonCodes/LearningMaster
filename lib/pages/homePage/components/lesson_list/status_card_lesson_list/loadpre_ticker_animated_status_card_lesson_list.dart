import 'package:flutter/material.dart';
import './animated_status_card_lesson_list.dart';
import '../util_lesson_list/util_lesson_list.dart';



//包装加载上一个的加载指示器动画
class LoadPreStatusAnimatedTicker extends StatefulWidget {
  final LessonListUtil lessonListUtil;
  const LoadPreStatusAnimatedTicker({super.key, required this.lessonListUtil});

  @override
  State<LoadPreStatusAnimatedTicker> createState() => _LoadPreStatusAnimatedTickerState();
}

class _LoadPreStatusAnimatedTickerState extends State<LoadPreStatusAnimatedTicker> with TickerProviderStateMixin,AutomaticKeepAliveClientMixin {

  late AnimationController animationController;


  @override
  void initState() {
    super.initState();
    animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    widget.lessonListUtil.setStartLoadPreStatusCardAnimate(startAnimate);
    widget.lessonListUtil.setReseverLoadPreStatusCardAnimate(reverseAnimate);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedStatusCard(
      animationController: animationController, 
      animation: Tween<double>(begin: 2.0, end:  1.0).animate(
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
      animationController.forward().then((value) {
        func();
      });
    }
    
  }

  Future<void> reverseAnimate(Function() func) async{
    if(animationController.status == AnimationStatus.completed){
      refreshUi();
      animationController.reverse().then((value){
        func();
      });
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