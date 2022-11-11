import "package:flutter/material.dart";
import '../../config/index.dart';
import './components/nav/nav.dart';
import 'components/class_list/class_list.dart';
import './components/lesson_list/lesson_list.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          width: MediaQuery.of(context).size.width <= 1920? 1920:MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //导航
              const Nav(
                avatarPath: 'https://c-ssl.duitang.com/uploads/blog/202107/23/20210723125859_f6b2f.jpeg',
                currentIndex: 0,
                userName: 'reddock',
               ),
                //课程
              Container(
                margin: const EdgeInsets.only(left: 24),
                child: const ClassList(initString: null,)),
                //课时
              Container(
                margin: const EdgeInsets.only(left: 24),
                child: LessonList(currentPage: '1', pages: '10', height: MediaQuery.of(context).size.height,),
              )

            ]),
          ),
        ),
      ),
    );
  }
}
