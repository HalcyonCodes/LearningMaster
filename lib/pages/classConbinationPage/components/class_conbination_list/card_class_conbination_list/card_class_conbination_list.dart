import 'package:flutter/material.dart';
import '../../../../../config/index.dart';

//课程组合卡片
class ClassConbiantionCard extends StatelessWidget {
  final String conbinationId;
  final String classCount;
  final String conbinationTitle;
  final String difficultyLevel;
  final String lengthLevel;
  final String usabilityLevel;
  final Function()? onClick;
  const ClassConbiantionCard(
      {super.key,
      required this.conbinationId,
      required this.classCount,
      required this.conbinationTitle,
      required this.difficultyLevel,
      required this.lengthLevel,
      required this.usabilityLevel,
      required this.onClick,
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick!(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: KColor.containerColor,
          boxShadow: [KShadow.shadow],
        ),
        margin: const EdgeInsets.only(bottom: 12),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      conbinationId,
                      style: KFont.profileInConbinatinClassCardStyle,
                      maxLines: 1,
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      '共 $classCount 门课程',
                      style: KFont.profileInConbinatinClassCardStyle,
                      maxLines: 1,
                    )
                  ]),
              const SizedBox(
                height: 12,
              ),
              Text(
                conbinationTitle,
                style: KFont.titleInConbinationClassCardStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        KString.difficultyLevelInClassConbinationCardString,
                        style: KFont.profileInConbinatinClassCardStyle,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        difficultyLevel,
                        style: KFont.levelInConbinationClassCardStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        KString.lengthLevelInInClassConbinationCardString,
                        style: KFont.profileInConbinatinClassCardStyle,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        difficultyLevel,
                        style: KFont.levelInConbinationClassCardStyle,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        KString.usabilityLevelInClassConbinationCardString,
                        style: KFont.profileInConbinatinClassCardStyle,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        difficultyLevel,
                        style: KFont.levelInConbinationClassCardStyle,
                      ),
                    ],
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
