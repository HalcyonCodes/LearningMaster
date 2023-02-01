import 'dart:io';
import 'package:dio/dio.dart';
import '../../util_class_conbination_page/page_util.dart';
import '../../model/data_model/class_conbination_data.dart' as data;
import '../../model/from_json_model/class_conbination_model.dart';

class ClassConbinationListViewModel {
  final ClassConbinationPageUtil pageUtil;

  String? initPage;
  String? maxPage;
  String? maxPageConbinationCount;
  String? searchString;
  String? conbinationId;
  Response? response;

  ClassConbinationModel? classConbinationModel;

  ClassConbinationListViewModel({required this.pageUtil});

  Future<int> refresh(String? conbinationId, String? searchString) async {
    //清理
    initPage = null;
    maxPage = null;
    maxPageConbinationCount = null;
    response = null;

    if (searchString != null) {
      searchString = searchString;
      //通过搜索字符串加载数据
    } else {
      if (conbinationId != null) {
        conbinationId = conbinationId;
        //通过conbinationId加载某一项
      } else {
        //加载首页
      }
    }

    response = await Dio().get('http://localhost:4040/');

    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      var tData = data.data;
      classConbinationModel = ClassConbinationModel();
      classConbinationModel = ClassConbinationModel.fromJson(tData);
      //写入状体
      initPage = classConbinationModel!.data.initPage;
      maxPage = classConbinationModel!.data.maxPage;
      maxPageConbinationCount = classConbinationModel!.data.maxPageContainCount;
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  Future<int> loadMore(int pageEndIndex, String? searchString) async {
    //清理
    classConbinationModel = null;
    response = null;
    //拷贝
    searchString = searchString;
    //判断加载
    if(searchString == null){
      //通过classId取得表并用pageEndIndex分页
    }else{
      //通过searchString取得表并用pageEndIndex分页
    }
        //===
    //dio请求数据
    response = await Dio().get('https://www.baidu.com/');
    //===
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据,后期删除
      var tData = data.data;
      classConbinationModel = ClassConbinationModel();
      classConbinationModel = ClassConbinationModel.fromJson(tData);
      //写入状态
      //initPage = classListModel!.data.initPage;
      //maxPage = classListModel!.data.maxPage;
      //pageMaxContainerCount = classListModel!.data.maxPageContainCount;
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  Future<int> loadPre(int pageStartIndex, String? searchString) async{
   
    //清理
    classConbinationModel = null;
    response = null;
    //拷贝
    searchString = searchString;
    //判断加载
    if(searchString == null){
      //通过classId取得表并用pageStartIndex分页
    }else{
      //通过searchString取得表并用pageStartIndex分页
    }
    //===
    //dio请求数据
    response = await Dio().get('https://www.baidu.com/');
    //===
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据,后期删除
      var tData = data.data;
      classConbinationModel = ClassConbinationModel();
      classConbinationModel = ClassConbinationModel.fromJson(tData);
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
