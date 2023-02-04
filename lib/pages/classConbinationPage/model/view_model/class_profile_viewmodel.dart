import 'dart:io';
import '../from_json_model/class_profile_model.dart';
import '../../util_class_conbination_page/page_util.dart';
import 'package:dio/dio.dart';
import '../data_model/class_profile_data.dart' as data;

class ClassProfileViewModel {
  final ClassConbinationPageUtil pageUtil;
  ClassProfileModel? classProfileModel;
  String? conbinationId;
  String? classId;
  Response? response;

  ClassProfileViewModel({required this.pageUtil}) {
    pageUtil.setFuncSetRefreshPara(setRefreshPara);
  }

  Future<int> refresh(String? tConbinationId, String? tClassId) async {
    conbinationId = null;
    classId = null;
    classProfileModel = null;
    response = null;
    if (tConbinationId != null && tClassId != null) {
      conbinationId = tConbinationId;
      classId = tClassId;
    } else {}

    //
    response = await Dio().get('http://localhost:4040/');

    if (response!.statusCode == HttpStatus.ok) {
      //解析
      var tData = data.data;
      classProfileModel = ClassProfileModel();
      classProfileModel = ClassProfileModel.fromJson(tData);
      //保存结果
      conbinationId = classProfileModel!.data.conbinationId;
      classId = classProfileModel!.data.classId;
      return response!.statusCode!;
    } else {
      return response!.statusCode!;
    }
  }

  void setRefreshPara(String tConbinationId, String tClassId) {
    conbinationId = tConbinationId;
    classId = tClassId;
  }
}
