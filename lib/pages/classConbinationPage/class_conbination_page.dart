import "package:flutter/material.dart";
import '../../config/index.dart';
import './components/nav/nav.dart';

class ClassConbinationPage extends StatefulWidget {
  const ClassConbinationPage({super.key});

  @override
  State<ClassConbinationPage> createState() => _ClassConbinationPageState();
}

class _ClassConbinationPageState extends State<ClassConbinationPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColor.backgroundColor,
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width <= 1920
              ? 1920
              : MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  //导航
                  const Nav(
                    avatarPath:
                        'https://c-ssl.duitang.com/uploads/blog/202107/23/20210723125859_f6b2f.jpeg',
                    currentIndex: 1,
                    userName: 'reddock',
                  ),
                  //课程

                  //课时
                ]),
          ),
        ),
      ),
    );
  }
}
