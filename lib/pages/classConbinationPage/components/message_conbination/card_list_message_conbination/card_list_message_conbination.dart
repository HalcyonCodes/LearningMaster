import 'package:flutter/material.dart';
import '../class_card_message_conbination/class_card_message_conbination.dart';

//课程组合简介卡片列表
class CardList extends StatelessWidget {

  const CardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 24,
      children: [
        ClassCard(classId: '001', lastUpdateTime: '2022/10/14', classCount: '50', className: '游戏逆向安全', classStatus: '连载中', onClick: (){},),
                  ClassCard(classId: '002', lastUpdateTime: '2022/10/14', classCount: '50', className: '游戏逆向安全游戏逆向安全', classStatus: '连载中', onClick: (){},),
                  ClassCard(classId: '003', lastUpdateTime: '2022/10/14', classCount: '50', className: 'C++基础', classStatus: '连载中', onClick: (){},),
      ],

    );
  }
}