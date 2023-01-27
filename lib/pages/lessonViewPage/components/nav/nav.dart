
import 'package:flutter/material.dart';
import '../../../../config/index.dart';
import './avatar_nav/avatar_nav.dart';
import './select_title_nav/select_title_nav.dart';


class Nav extends StatelessWidget {
  final String avatarPath;
  final String userName;
  final int currentIndex;

  const Nav({super.key, required this.avatarPath, required this.currentIndex, required this.userName});

  @override
  Widget build(BuildContext context) {
  
    return Container(
      height: MediaQuery.of(context).size.height - 24 * 2,
      width: 213,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: KColor.navColor,
        boxShadow: [KShadow.shadow],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Avatar(avatarPath: avatarPath, userName: userName),
              const SizedBox(height: 40,),
              SelectTitle(currentIndex: currentIndex),
            ],
          ),
        ),
      ),
    );
  }
}