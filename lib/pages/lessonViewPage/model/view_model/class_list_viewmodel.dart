import 'dart:io';
import '../../pageUtil/page_util.dart';
import 'package:dio/dio.dart';
import '../from_json_model/class_list_model.dart';

//调试
import '../data_model/class_list_data.dart' as data;

class ClassListViewModel {
  late String initPage; //从哪一页开始
  late String maxPage; //最大页数
  late String pageMaxContainerCount; //最大页容量
  late String? searchString; //搜索字符串
  final LessonViewPageUtil pageUtil; //页面utel
  late Response? response; //http请求
  late ClassListModel? classListModel; //模型

  ClassListViewModel({required this.pageUtil});

  //刷新数据
  Future<int> refresh(
      String? classId, String? page, String? searchString) async {
    //清理
    classListModel = null;
    response = null;
    //拷贝
    searchString = searchString;

    //===拼接请求字符串
    if (searchString != null) {
      if (page != null) {
        if (classId != null) {
          //查询是否有classId项，加载classId项，在url中消除page一项
        } else {
          //在搜索中请求目标页的数据，如果没有目标页则返回最近的那一页并通过pageUtil更新url
        }
      } else {
        if (classId != null) {
          //直接在搜索结果中查找classId那一项，并显示结果，不维护url
        } else {
          //直接显示字符串搜索结果，不维护url
        }
      }
    } else {
      if (page != null) {
        if (classId != null) {
          //直接显示classId那一项
        } else {
          //显示数据库普通状态下的那一页，如果没有则加载最近的一页并修改url
        }
      } else {
        if (classId != null) {
          //直接显示classId那一项
        } else {
          //直接加载普通状态下的最后一页
        }
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
      pageMaxContainerCount = classListModel!.data.maxPageContainCount;
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  //加载更多
  Future<int> loadMore(int pageEndIndex,String? searchString) async {
    //清理
    classListModel = null;
    response = null;
    //拷贝
    searchString = searchString;
    //判断是否在搜索范围内的加载
    if(searchString == null){
      //拼接请求字符串
    }else{
      //拼接请求字符串
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
    if(searchString == null){
      //拼接请求字符串
    }else{
      //拼接请求字符串
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
