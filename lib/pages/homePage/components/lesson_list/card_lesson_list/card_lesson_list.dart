import 'package:flutter/material.dart';
import '../../../../../config/index.dart';
import '../card_lesson_list/tag_lesson_list.dart';

class LessonCard extends StatefulWidget {
  final String? className;
  final String? lessonId;
  final String? lessonTitle;
  final String? lessonProfile;
  final List<String>? lessonTags;
  final Function? onClick;

  const LessonCard({
    super.key,
    required this.className,
    required this.lessonId,
    required this.lessonTitle,
    required this.lessonProfile,
    required this.lessonTags,
    this.onClick,
  });

  @override
  State<LessonCard> createState() => _LessonCardState();
}

class _LessonCardState extends State<LessonCard> {
  late String className;
  late String lessonId;
  late String lessonTitle;
  late String lessonProfile;
  late List<String> lessonTags;
  late Function? onClick;

  @override
  void initState() {
    super.initState();
  }

  List<Widget> tags = [];

  @override
  Widget build(BuildContext context) {
    className = widget.className!;
    lessonId = widget.lessonId!;
    lessonTitle = widget.lessonTitle!;
    lessonProfile = widget.lessonProfile!;
    lessonTags = widget.lessonTags!;

    tags = List.generate(widget.lessonTags!.length, (index) {
      return LessonTag(tagName: widget.lessonTags![index]);
    });

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          //margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
              boxShadow: [KShadow.shadow],
              borderRadius: BorderRadius.circular(16),
              color: KColor.containerColor),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              onClick!();
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, top: 12, bottom: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          flex: 8,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                className,
                                style: KFont.greyMsgStyle,
                              ))),
                      const Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 8,
                        child: Container(
                          alignment: Alignment.centerRight,
                          child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                '课时 $lessonId',
                                style: KFont.greyMsgStyle,
                              )),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.lessonTitle!,
                    style: KFont.classCardTitleStyle,
                    maxLines: 5,
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text(
                    widget.lessonProfile!,
                    style: KFont.greyMsgStyle,
                    maxLines: 5,
                    overflow: TextOverflow.fade,
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Wrap(
                    alignment: WrapAlignment.start,
                    children: tags,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 12,)
      ],
    );
  }
}
