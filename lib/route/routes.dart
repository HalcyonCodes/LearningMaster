import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import './handle_route.dart';

class Routes {
  static String root = '/';
  static String lessonViewPage = '/lessonViewPage';
  static String classConbinationPage = '/classConbinationPage';
  //----page----

  //------------
  static void configureRotes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> para) {
      print('Error ==> Route Was Not Found!');
      return null;
    });

    //----路由配置----
    router.define(root, handler: lessonViewPageHandle);
    router.define(lessonViewPage, handler: lessonViewPageHandle);
    router.define(classConbinationPage, handler: classConbinationPageHandle);
  }
}
