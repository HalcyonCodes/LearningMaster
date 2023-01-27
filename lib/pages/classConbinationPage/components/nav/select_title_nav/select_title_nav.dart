import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:learning_master/config/index.dart';
import './item_select_title_nav.dart';
import '../../../../../route/application.dart';

class SelectTitle extends StatefulWidget {
  final int currentIndex;
  const SelectTitle({super.key, required this.currentIndex});

  @override
  State<SelectTitle> createState() => _SelectTitleState();
}

class _SelectTitleState extends State<SelectTitle> {
  int? currentIndex;
  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(2, (index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SelectTitleItem(
                isSelect: currentIndex == index,
                title: index == 0
                    ? KString.navClassString
                    : KString.navClassClassString,
                iconPath: index == 0 ? 'svg/github.svg' : 'svg/硬盘.svg',
                onClick: index == 0 ? firstItemOnClick : secondItemOnClick),
            const SizedBox(
              height: 20,
            )
          ],
        );
      }),
    );
  }

  void firstItemOnClick() {
    Application.router!.navigateTo(context, '/lessonViewPage',
        transition: TransitionType.fadeIn);
  }

  void secondItemOnClick() {
    //Application.router!.navigateTo(context, '/classConbinationPage',
    //   transition: TransitionType.fadeIn);
  }
}
