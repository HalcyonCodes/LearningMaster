import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_master/config/index.dart';

class SelectTitleItem extends StatelessWidget {
  final bool isSelect;
  final String title;
  final String iconPath;
  final Function onClick;

  const SelectTitleItem({super.key, required this.isSelect, required this.title, required this.iconPath,required this.onClick});

  @override
  Widget build(BuildContext context) {
    
    return GestureDetector(
      onTap: (){
        onClick();
      },
      child: Container(
        height: 60,
        width: 189,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isSelect? KColor.primaryColor: KColor.navColor,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 18),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(title, style: KFont.navStyle,),
              const Expanded(child: SizedBox()),
              SizedBox(
                height: 22,
                width: 22,
                child: SvgPicture.asset(
                  iconPath,
                  color: Colors.white,
                  ),
              ),
            ],
          ),
        )
      ),
    );
  }
}