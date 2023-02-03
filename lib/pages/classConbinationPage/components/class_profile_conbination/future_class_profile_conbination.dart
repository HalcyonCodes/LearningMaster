import 'package:flutter/material.dart';
import '../../model/view_model/class_profile_viewmodel.dart';
import './class_profile_conbination.dart';
import '../../util_class_conbination_page/page_util.dart';

class ClassProfileFuture extends StatefulWidget {
  final String? conbinationId;
  final String? classId;
  final ClassProfileViewModel viewModel;
  final ClassConbinationPageUtil pageUtil;
  const ClassProfileFuture(
      {super.key, required this.viewModel,
       required this.pageUtil,
       this.classId, this.conbinationId});

  @override
  State<ClassProfileFuture> createState() => _ClassProfileFutureState();
}

class _ClassProfileFutureState extends State<ClassProfileFuture> {
  late String? conbinationId;
  late String? classId;

  @override
  void initState() {
    super.initState();
    classId = widget.conbinationId;
    conbinationId = widget.conbinationId;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.viewModel.refresh(conbinationId, classId),
        builder: ((context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return const Text('none');

            case ConnectionState.waiting:
              return const Text('waiting');

            case ConnectionState.active:
              return const Text('active');

            case ConnectionState.done:
              if (snapshot.hasError) {
                return const Text('error');
              } else {
                //通过classId和conbinationId构造路由，
                return ClassProfile(
                  classProfile:
                      widget.viewModel.classProfileModel!.data.profile,
                  onClick: () {},
                );
              }
          }
        }));
  }

  void setRefreshParaNull() {
    conbinationId = null;
    classId = null;
  }


  void refreshUi(){
    setState(() {
      
    });
  }

}
