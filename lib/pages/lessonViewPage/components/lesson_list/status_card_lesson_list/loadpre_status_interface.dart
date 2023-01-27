import 'package:flutter/material.dart';
import 'loadpre_animated_status_card_lesson_list.dart';
import '../util_lesson_list/util_lesson_list.dart';

//包装加载上一个的加载指示器动画
class LoadPreStatusInterface extends StatefulWidget {
  final LessonListUtil lessonListUtil;
  final AnimationController animationController;
  final Widget widget;
  const LoadPreStatusInterface(
      {super.key,
      required this.lessonListUtil,
      required this.animationController,
      required this.widget});

  @override
  State<LoadPreStatusInterface> createState() => _LoadPreStatusInterfaceState();
}

class _LoadPreStatusInterfaceState extends State<LoadPreStatusInterface>
    with AutomaticKeepAliveClientMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    //animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 600));
    animationController = widget.animationController;
    widget.lessonListUtil.setStartLoadPreStatusCardAnimate(startAnimate);
    widget.lessonListUtil.setReseverLoadPreStatusCardAnimate(reverseAnimate);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    //return LoadPreAnimatedStatusCard(
    //  animationController: animationController,
    //  animation: Tween<double>(begin: 0, end:  1.0).animate(
    //   CurvedAnimation(
    //    parent: animationController,
    //   curve: const Interval((1 / 3) * 0, 1.0,
    //      curve: Curves.fastOutSlowIn
    //   )
    // )
    //),
    //statusString: widget.lessonListUtil.statusText);
    return widget.widget;
  }

  Future<void> startAnimate(Function() func) async {
    if (animationController.status != AnimationStatus.completed) {
      refreshUi();
      animationController.forward().then((value) {
        func();
      });
    }
  }

  Future<void> reverseAnimate(Function() func) async {
    if (animationController.status == AnimationStatus.completed) {
      refreshUi();
      animationController.reverse().then((value) {
        func();
      });
    }
  }

  void refreshUi() {
    setState(() {});
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
