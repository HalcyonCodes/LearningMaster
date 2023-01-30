import 'package:flutter/material.dart';
import 'search_class_list.dart/search_lesson_list.dart';
import 'card_class_list.dart/card_lesson_list.dart';

//课程卡片列表
class ClassList extends StatefulWidget {
  final String? initString;


  const ClassList({super.key, this.initString});
  @override
  State<ClassList> createState() => _ClassListState();
}

class _ClassListState extends State<ClassList> {

  late ScrollController scrollController;
  @override
  void initState() {
    super.initState();
    scrollController = ScrollController();
   
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width >= 1920 
        ?((MediaQuery.of(context).size.width - 24) / 24) * 5 - 24
        :( 1920 - 24) / 24 * 5 - 24,
      height: MediaQuery.of(context).size.height - 24 * 2 ,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           ClassSearch(initSearchString: widget.initString),
           const SizedBox(height: 12,),
           SizedBox(
            height: MediaQuery.of(context).size.height - 24 * 2 - 46 - 12,
             child: ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
               child: ListView(
                children: [
                  ClassCard(classId: '001', lastUpdateTime: '2022/10/14', classCount: '50', className: '游戏逆向安全', classStatus: '连载中', onClick: (){},),
                  ClassCard(classId: '001', lastUpdateTime: '2022/10/14', classCount: '50', className: '游戏逆向安全游戏逆向安全', classStatus: '连载中', onClick: (){},),
                  ClassCard(classId: '001', lastUpdateTime: '2022/10/14', classCount: '50', className: 'C++基础', classStatus: '连载中', onClick: (){},),
                   
                ],
               ),
             ),
           )
        ],
      ),
    );
  }
}