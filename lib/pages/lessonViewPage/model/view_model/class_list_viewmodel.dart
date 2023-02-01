import 'dart:io';
import '../../pageUtil/page_util.dart';
import 'package:dio/dio.dart';
import '../from_json_model/class_list_model.dart';

//调试
import '../data_model/class_list_data.dart' as data;

class ClassListViewModel {
  late String initPage; //从哪一页开始
  late String maxPage; //最大页数
  late String maxPageContainerCount; //最大页容量
  late String? searchString; //搜索字符串
  final LessonViewPageUtil pageUtil; //页面utel
  late Response? response; //http请求
  late ClassListModel? classListModel; //模型

  ClassListViewModel({required this.pageUtil});

  //刷新数据
  Future<int> refresh(String? classId, String? searchString) async {
    //清理
    classListModel = null;
    response = null;
    //拷贝
    searchString = searchString;

    //===拼接请求字符串
    if (searchString != null) {
      //根据searchString返回数据
    } else {
      if (classId != null) {
        //直接显示classId那一项
      } else {
        //显示数据库普通状态下的那一页，如果没有则加载最近的一页并修改url
      }
    }

    //===
    //dio请求数据
    response = await Dio().get('http://localhost:4040/');
    //===
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据,后期删除
      var tData = data.data;
      classListModel = ClassListModel.fromJson(tData);
      //写入状态
      initPage = classListModel!.data.initPage;
      maxPage = classListModel!.data.maxPage;
      maxPageContainerCount = classListModel!.data.maxPageContainCount;
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //加载更多
  Future<int> loadMore(int pageEndIndex, String? searchString) async {
    //清理
    classListModel = null;
    response = null;
    //拷贝
    searchString = searchString;
    //判断是否在搜索范围内的加载
    if (searchString == null) {
      //通过classId取得表并用pageEndIndex分页
    } else {
      //通过searchString取得表并用pageEndIndex分页
    }
    //===
    //dio请求数据
    response = await Dio().get('https://www.baidu.com/');
    //===
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据,后期删除
      var tData = data.data;
      classListModel = ClassListModel.fromJson(tData);
      //写入状态
      //initPage = classListModel!.data.initPage;
      //maxPage = classListModel!.data.maxPage;
      //pageMaxContainerCount = classListModel!.data.maxPageContainCount;
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //加载上一个
  Future<int> loadPre(int pageStartIndex, String? searchString) async {
    //清理
    classListModel = null;
    response = null;
    //拷贝
    searchString = searchString;
    //判断是否在搜索范围内的加载
    if (searchString == null) {
      //通过classId取得表并用pageStartIndex分页
    } else {
      //通过searchString取得表并用pageStartIndex分页
    }
    //===
    //dio请求数据
    response = await Dio().get('https://www.baidu.com/');
    //===
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据,后期删除
      var tData = data.data;
      classListModel = ClassListModel.fromJson(tData);
      //写入状态
      //initPage = classListModel!.data.initPage;
      //maxPage = classListModel!.data.maxPage;
      //pageMaxContainerCount = classListModel!.data.maxPageContainCount;
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }
}
