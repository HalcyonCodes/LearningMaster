import './color.dart';
import 'package:flutter/material.dart';

class KFont{
  //用户名称字体
  static TextStyle userNameStyle = const TextStyle(
    fontFamily: 'MiSans',
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    height: 22/18,
  );

  //导航栏字体
  static TextStyle navStyle = const TextStyle(
    fontFamily: 'MiSans',
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    height: 22/18,
  );

  //卡片中次要信息灰色字体
  static TextStyle greyMsgStyle = TextStyle(
    fontFamily: 'MiSans',
    fontSize: 13,
    color: KColor.greyTextColor,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    height: 17/13,
  );

  //课程卡片标题字体
  static TextStyle classCardTitleStyle = const TextStyle(
    fontFamily: 'MiSans',
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
    //height: 25/18,
  );

  //课程卡片中课程连载状态字体
  static TextStyle classStatusStyle = const TextStyle(
    fontFamily: 'MiSans',
    fontSize: 13,
    color: Colors.black,
    fontWeight: FontWeight.w600,
    decoration: TextDecoration.none,
    //height: 25/13
  );

  //搜索栏字体
  static TextStyle searchBarStyle = const TextStyle(
    fontFamily: 'MiSans',
    fontSize: 18,
    color: Colors.black,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    //height: 22/18,
    
  );

  //搜索栏初始化提示字体
  static TextStyle searchBarInitStyle = TextStyle(
    fontFamily: 'MiSans',
    fontSize: 18,
    color: KColor.greyTextColor,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    //height: 22/18,
  );
  
  //标签里的字体
  static TextStyle tagStyle = const TextStyle(
    fontFamily: 'MiSans',
    fontSize: 13,
    color: Colors.white,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    height: 16/13
  );

  //页面指示器里的字体
  static TextStyle pagePoint = const TextStyle(
    fontFamily: 'MiSans',
    fontSize: 13,
    color: Colors.black,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    height: 17/13
  );


  //刷新指示器里的字体
  static TextStyle loadStatusStyle =  TextStyle(
    fontFamily: 'MiSans',
    fontSize: 13,
    color: KColor.primaryColor,
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
    height: 13/13,
  );
}