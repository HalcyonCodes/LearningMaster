import 'dart:io';
import 'package:dio/dio.dart';
import '../../util_class_conbination_page/page_util.dart';
import '../from_json_model/message_conbination_model.dart';
//调试
import '../data_model/message_conbination_data.dart' as data;

class ConbinationMessageViewModel {
  final ClassConbinationPageUtil pageUtil;
  Response? response;
  ConbinationMessageModel? conbinationMessageModel;
  String? conbinationId;

  ConbinationMessageViewModel({required this.pageUtil}) {
    //注册；
    pageUtil.setFuncSetConbinationId(setConbinationId);
    conbinationId = null;
  }

  Future<int> refresh(String? id) async {
    response = null;
    conbinationMessageModel = null;
    //conbinationId = null;
    //通过conbinationId拼接字符串
    if (id == null) {
    } else {
      conbinationId = id;
    }
    //print('$conbinationId');
    //如果id为Null则加载首页头部的conbinationId
    response = await Dio().get('http://localhost:4040/');
    if (response!.statusCode == HttpStatus.ok) {
      //模拟加载数据
      var tData = data.data;
      //解析数据
      conbinationMessageModel = ConbinationMessageModel.fromJson(tData);
      //保存结果
      conbinationId = conbinationMessageModel!.data.conbinationId;
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  void setConbinationId(String? id) {
    conbinationId = id;
  }
}
