import 'package:flutter/material.dart';
import 'package:learning_master/config/index.dart';
import 'dart:ui' as ui;
import 'dart:html';




class Avatar extends StatefulWidget {

  final String avatarPath;
  final String userName;

  const Avatar({super.key, required this.avatarPath,required this.userName});
  
  @override
  State<Avatar> createState() => _AvatarState();
}


class _AvatarState extends State<Avatar> {

  late String divId;

  @override
  void initState() {
    super.initState();
    divId = "web_image_${DateTime.now().toIso8601String()}";
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(
      divId,
          (int viewId) => ImageElement(
            height: 86,
            width: 86,
            src: 'https://wx4.sinaimg.cn/large/006sMHSTly1gdwjvjek3nj32bc2bc4qp.jpg'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18,top: 4),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            ClipOval(
              child:SizedBox(
              height: 86,
              width: 86,
                child: HtmlElementView(key: UniqueKey(),viewType: divId,))),
          const SizedBox(height: 12,),
          Text(widget.userName,style: KFont.userNameStyle,)
        ],
      ),
    );
  }
}