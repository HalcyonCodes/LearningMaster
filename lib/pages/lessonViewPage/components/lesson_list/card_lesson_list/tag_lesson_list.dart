import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_master/config/index.dart';

class LessonTag extends StatelessWidget {
  final String tagName;
  const LessonTag({super.key, required this.tagName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 16, bottom: 8),
      height: 26,
      decoration: BoxDecoration(
        color: KColor.primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
          
            SizedBox(
                height: 16,
                width: 16,
                child: SvgPicture.asset('svg/tag.svg',color: KColor.containerColor,),
              
            ),
            const SizedBox(width: 8,),
            SizedBox (
              height: 16,
              child: Text(tagName, style: KFont.tagStyle,)),

          ],
        ),
      ),
    );
  }
}