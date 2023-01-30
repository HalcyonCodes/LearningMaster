import 'package:flutter/material.dart';
import '../../../../../config/index.dart';

//课程组合课程简介
class ConbinationProfile extends StatelessWidget {
  final String profile;
  const ConbinationProfile({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KColor.containerColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [KShadow.shadow],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(KString.titleInMessageConbinationProfileString,
              style: KFont.titleInMessageConbinationProfileStyle,
            ),
            const SizedBox(height: 12,),
            Text(
              profile,
              style: KFont.contentInMessageConbinationProfileStyle,
            )

          ],
        ),
      ),
    );
  }
}
