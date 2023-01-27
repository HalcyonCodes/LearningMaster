import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
//----页面----
import '../pages/homePage/home_page.dart';
import '../pages/classConbinationPage/class_conbination_page.dart';
import '../pages/lessonViewPage/lesson_view_page.dart';

//import '../';

Handler homePageHandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return HomePage();
});

Handler lessonViewPageHandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return LessonViewPage();
});


Handler classConbinationPageHandle = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return ClassConbinationPage();
});
