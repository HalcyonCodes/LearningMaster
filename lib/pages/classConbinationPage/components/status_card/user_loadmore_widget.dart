import 'package:flutter/material.dart';
import './loadmore_animated_status_card.dart';
import 'package:double_bladed_axe/double_bladed_axe.dart';

class UserLoadMoreWidget extends StatefulWidget {
  final ListUtil listUtil;
  const UserLoadMoreWidget({super.key, required this.listUtil});

  @override
  State<UserLoadMoreWidget> createState() => _UserLoadMoreWidgetState();
}

class _UserLoadMoreWidgetState extends State<UserLoadMoreWidget>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return LoadMoreStatusInterface(
        listUtil: widget.listUtil,
        animationController: animationController,
        widget: LoadMoreAnimatedStatusCard(
            animationController: animationController,
            animation: Tween<double>(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                    parent: animationController,
                    curve: const Interval((1 / 3) * 0, 1.0,
                        curve: Curves.fastOutSlowIn))),
            statusString: widget.listUtil.statusText));
  }
}
