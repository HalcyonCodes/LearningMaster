import '../../../../../config/index.dart';

import 'package:flutter/material.dart';


//课程简介课程卡片
class ClassCard extends StatelessWidget {

final String classId;
  final String className;
  final String lastUpdateTime;
  final String classCount;
  final String classStatus;
  final Function onClick;

  const ClassCard({
    super.key,
    required this.classId,
    required this.lastUpdateTime,
    required this.classCount,
    required this.className,
    required this.classStatus,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      height: 107,
      width: MediaQuery.of(context).size.width >= 1920
          ? ((MediaQuery.of(context).size.width - 24) / 24) * 5 - 24
          : (1920 - 24) / 24 * 5 - 24,
      decoration: BoxDecoration(
        color: KColor.containerColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [KShadow.shadow],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: (){
          onClick();
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 6,
                decoration: BoxDecoration(
                  color: KColor.primaryColor,
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width >= 1920
                        ? ((MediaQuery.of(context).size.width - 24) / 24) * 5 -
                            24 -
                            24 * 2 -
                            6 -
                            12
                        : (1920 - 24) / 24 * 5 - 24 - 24 * 2 - 6 - 12,
                    child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 8,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  classId,
                                  style: KFont.greyMsgStyle,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const Expanded(flex: 2,child:SizedBox(),),
                            Expanded(
                              flex: 8,
                              child: Container(
                                alignment: Alignment.centerRight,
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Text(
                                    '共 $classCount 篇',
                                    style: KFont.greyMsgStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            )
                          ]),
                    
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width >= 1920
                        ? ((MediaQuery.of(context).size.width - 24) / 24) * 5 -
                            24 -
                            24 * 2 -
                            6 -
                            12
                        : (1920 - 24) / 24 * 5 - 24 - 24 * 2 - 6 - 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          flex: 9,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              className,
                              style: KFont.classCardTitleStyle,
                              maxLines: 1,
                            ),
                          ),
                        ),
                        const Expanded(flex: 1,child: SizedBox()),
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: Text(
                              classStatus,
                              style: KFont.classStatusStyle,
                              maxLines: 1,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    '最后更新时间： $lastUpdateTime',
                    style: KFont.greyMsgStyle,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}