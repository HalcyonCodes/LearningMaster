import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:learning_master/config/index.dart';

//课程卡片列表顶部搜索栏
class ClassConbinationSearch extends StatefulWidget {
  final String? initSearchString;
  const ClassConbinationSearch({super.key, required this.initSearchString});

  @override
  State<ClassConbinationSearch> createState() => _ClassConbinationSearchState();
}

class _ClassConbinationSearchState extends State<ClassConbinationSearch> {
  late TextEditingController textEditController;
  @override
  void initState() {
    super.initState();
    textEditController = TextEditingController(text: widget.initSearchString);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: KColor.containerColor,
        boxShadow: [KShadow.shadow],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Container(
          height: 46,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 22,
                width: 22,
                child: SvgPicture.asset(
                  'svg/搜索.svg',
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Expanded(
                child: Container(
                  height: 22,
                  alignment: Alignment.center,
                  child: TextField(
                    
                    controller: textEditController,
                    maxLines: 1,
                    style: KFont.searchBarStyle,
                    autofocus: false,
                    cursorColor: Colors.black,
                    cursorWidth: 2,
                    cursorHeight: 22,
                    keyboardType: TextInputType.text,
                    inputFormatters: <TextInputFormatter>[
                      LengthLimitingTextInputFormatter(200),
                    ],
                    maxLength: null,
                    onSubmitted: onSubmitted,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: KString.initInClassConbinationSearchString,
                      contentPadding: EdgeInsets.zero,
                      hintStyle: KFont.searchBarInitStyle,
                      isDense: true,
                      hintMaxLines: 1,
                      
                    ),
                    strutStyle: const StrutStyle(leading: 0),
                    onChanged: (text){},
                    
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onSubmitted(String text) {}
}
