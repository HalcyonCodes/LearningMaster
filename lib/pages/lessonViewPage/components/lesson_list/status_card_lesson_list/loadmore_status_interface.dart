import 'package:flutter/material.dart';
import '../util_lesson_list/util_lesson_list.dart';
import 'loadmore_animated_status_card_lesson_list.dart';

//封装加载更多的指示器动画
class LoadMoreStatusInterface extends StatefulWidget {
  final LessonListUtil lessonListUtil;
  final AnimationController animationController;
  final Widget widget;
  const LoadMoreStatusInterface(
      {super.key,
      required this.lessonListUtil,
      required this.animationController,
      required this.widget});

  @override
  State<LoadMoreStatusInterface> createState() =>
      _LoadMoreStatusInterfaceState();
}

class _LoadMoreStatusInterfaceState
    extends State<LoadMoreStatusInterface>
    with AutomaticKeepAliveClientMixin{
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = widget.animationController;
    widget.lessonListUtil.setStartLoadMoreStatusCardAnimate(startAnimate);
    widget.lessonListUtil.setReverseLoadMoreStatusCardAnimate(reverseAnimate);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.widget;
  }

  Future<void> startAnimate(Function() func) async {
    if (animationController.status != AnimationStatus.completed) {
      refreshUi();
      await animationController.forward().then((value) {
        func();
      });
    }
  }

  Future<void> reverseAnimate(Function() func) async {
    if (animationController.status == AnimationStatus.completed) {
      refreshUi();
      await animationController.reverse().then((value) {
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
