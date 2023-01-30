import 'package:flutter/material.dart';

import 'conbination_profile_message_conbination/proflile_conbination_message_conbination.dart';
import './card_list_message_conbination/card_list_message_conbination.dart';

class ConbinationMessage extends StatelessWidget {
  const ConbinationMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height - 24 * 2,
      width: MediaQuery.of(context).size.width >= 1920
          ? ((MediaQuery.of(context).size.width - 24) / 24) * 10 - 24
          : (1920 - 24) / 24 * 10 - 24,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          ConbinationProfile(
              profile:
                  '想开发一个app?却无从下手?试试这个app前端开发课程!这个课程组合将学习使用flutter技术构建app前端应用。flutter是一个移动UI框架。使用flutter可以构建app界面。而且flutter是跨平台的, 一套代码可以在windows,macOs,linux。web所有平台呈现设计稿里的内容。'),
          SizedBox(
            height: 24,
          ),
          CardList(),
        ],
      ),
    );
  }
}
