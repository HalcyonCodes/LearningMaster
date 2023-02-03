import 'package:flutter/material.dart';
import './card_class_profile_conbination/card_class_profile_conbination.dart';

class ClassProfile extends StatelessWidget {
  final String classProfile;
  final Function()? onClick;
  const ClassProfile({super.key, required this.classProfile, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width >= 1920
          ? ((MediaQuery.of(context).size.width - 24) / 24) * 5 - 24
          : (1920 - 24) / 24 * 5 - 24,
      child: ClassProfileCard(
        profile: classProfile,
        onCardClick: onClick!,
      ),
    );
  }
}
