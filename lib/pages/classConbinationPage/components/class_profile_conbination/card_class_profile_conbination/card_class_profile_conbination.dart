import 'package:flutter/material.dart';
import '../../../../../config/index.dart';

class ClassProfileCard extends StatelessWidget {
  final String profile;
  final Function() onCardClick;
  const ClassProfileCard(
      {super.key, required this.onCardClick, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KColor.containerColor,
        boxShadow: [KShadow.shadow],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              KString.titleInMessageConbinationClassProfileString,
              style: KFont.titleInMessageConbinationProfileStyle,
            ),
            const SizedBox(
              height: 12,
            ),
            Text(
              profile,
              style: KFont.contentInMessageConbinationProfileStyle,
            ),
            const SizedBox(
              height: 24,
            ),
            InkWell(
              onTap: onCardClick,
              borderRadius: BorderRadius.circular(8),
              child: Container(
                height: 46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: KColor.primaryColor,
                ),
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Text(
                    KString.buttonInMessageConbinationClassProfileString,
                    style: KFont.buttonInMessageConbinationClassProfileStyle,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
