
import 'package:flutter/material.dart';
import './status_card_lesson_list.dart';

class AnimatedStatusCard extends StatefulWidget {
  final String statusString;
  final AnimationController animationController;
  final Animation<double> animation; 
  const AnimatedStatusCard({super.key, required this.animationController, required this.animation, required this.statusString});


  @override
  State<AnimatedStatusCard> createState() => _AnimatedStatusCardState();

}

class _AnimatedStatusCardState extends State<AnimatedStatusCard> {

   @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animation,
      builder: (context,child){
        return FadeTransition(
          opacity: widget.animation,
          child: Transform(
            transform: Matrix4.translationValues(
              0.0, 
              30 * (1.0 - widget.animation.value), 
              0.0),
            child: StatusCard(status: widget.statusString,),
          ),
        );
      },
    );
  }

  


}