import 'dart:io';
import 'package:dio/dio.dart';
import '../../pageUtil/page_util.dart';
import '../from_json_model/lesson_list_model.dart';
//调试
import '../data_model/lesson_list_data.dart' as data;

class LessonListViewModel {
  final LessonViewPageUtil pageUtil;
  late String? initPage;
  late String? maxPage;
  late String? pageMaxContainerCount;
  late String? searchString;
  late Response? response;
  late LessonListModel? lessonListModel;
  late String? listClassId;
  late String? lessonId;

  LessonListViewModel({required this.pageUtil}) {
    pageUtil.setFuncSetClassId(setClassId);
  }

  Future<int> refresh(
      String? classId, String? lessonId, String? searchString) async {
 
    //清理
    lessonListModel = null;
    response = null;
    searchString = null;
    lessonId = null;
    initPage = null;
    maxPage = null;
    pageMaxContainerCount = null;

    //拷贝
    searchString = searchString;

    //===拼接请求字符串
    if (searchString != null) {
      //直接显示搜索结果，把url设置为只有searchString；
    } else {
      if (classId != null) {
        listClassId = classId;
        if (lessonId != null) {
          lessonId = lessonId;
          //查询ClassId里是否有lessonId项目，如果没有则把url维护为只有classId项，并显示classId项头部
          //如果classId里有lessonId项，则在列表的头部显示lessonId项，并添加后几项
        } else {
          //直接显示ClassId列表的头部
        }
      } else {
        if (lessonId != null) {
          lessonId = lessonId;
          //通过lessonId查找classId，并以lessonId为头部显示classId列表，并添加后几项，维护url为正确lessonId和正确classId
        } else {
          //直接加载第一个classId的头部
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
      lessonListModel = LessonListModel();
      lessonListModel = LessonListModel.fromJson(tData);
      //写入状态
      initPage = lessonListModel!.data.initPage;
      maxPage = lessonListModel!.data.maxPage;
      pageMaxContainerCount = lessonListModel!.data.maxPageContainCount;
      listClassId = lessonListModel!.data.classId;
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  Future<int> loadMore(String pageEndIndex,String? searchString) async {
    response = null;

    if (searchString == null) {
      //根据listClassId和lessonId取得表，然后用pageEndIndex获得分页
    } else {
      //根据searchString取得表，然后用pageEndIndex分页
    }
    //===
    //dio请求数据
    response = await Dio().get('http://localhost:4040/');
    //===
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据,后期删除
      var tData = data.data;
      lessonListModel = LessonListModel();
      lessonListModel = LessonListModel.fromJson(tData);
      //写入状态
      initPage = lessonListModel!.data.initPage;
      maxPage = lessonListModel!.data.maxPage;
      pageMaxContainerCount = lessonListModel!.data.maxPageContainCount;
      listClassId = lessonListModel!.data.classId;
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  Future<int> loadPre(String pageStartIndex,String? searchString) async {
    if (searchString == null) {
      //根据listClassId和lessonId取得表，然后用pageStartIndex获得分页
    } else {
      //根据searchString取得表，然后用pageStartIndex分页
    }
    //===
    //dio请求数据
    response = await Dio().get('http://localhost:4040/');
    //===
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据,后期删除
      var tData = data.data;
      lessonListModel = LessonListModel();
      lessonListModel = LessonListModel.fromJson(tData);
      //写入状态
      initPage = lessonListModel!.data.initPage;
      maxPage = lessonListModel!.data.maxPage;
      pageMaxContainerCount = lessonListModel!.data.maxPageContainCount;
      listClassId = lessonListModel!.data.classId;
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  void setClassId(String id) {
    listClassId = id;
  }
}
