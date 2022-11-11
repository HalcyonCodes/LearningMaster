import 'package:flutter/material.dart';
import 'package:learning_master/config/index.dart';
import './item_select_title_nav.dart';

class SelectTitle extends StatelessWidget {
  final int currentIndex;


  const SelectTitle({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(2, (index){
          return  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SelectTitleItem(
                    isSelect: currentIndex == index, 
                    title: index == 0 ? KString.navClassString: KString.navClassClassString, 
                    iconPath: index == 0? 'svg/github.svg': 'svg/硬盘.svg', 
                    onClick: index == 0? (){} : (){}),
                  const SizedBox(height: 20,)
                ],
              );
        }),
      
    );

  }
}