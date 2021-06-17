import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/components/HotRank.dart';
import 'package:flutter_application_1/components/Menu.dart';
import 'package:flutter_application_1/controller/GetPageIndexController.dart';
import 'package:flutter_application_1/controller/music_controller.dart';
import 'package:flutter_application_1/pages/video_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'components/NCard.dart';
import 'components/NavMenu.dart';
import 'components/TabBar.dart';
import 'components/Swiper.dart';
import 'model/music.dart';
import 'model/nav_item.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => GetMaterialApp(
        title: "喵村云音乐",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.red),
        home: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MusicController _musicController = Get.put(MusicController());

  ScrollController _scrollController = ScrollController();
  PageController _pageController = PageController();

  List<String> imageList = ["1", "2", "3"];

  List<Widget> pages = [];
  double padding = 16;
  int currentIdx = 0;
  final GetPageIndexController _pageSateCtr = Get.put(GetPageIndexController());
  var dragStartBehavior = () => {};

  @override
  void initState() {
    _musicController.getMusic();
    // musicList.add(music);
    super.initState();
    _buildPage(pages);
    _pageController.addListener(() {});
    _scrollController.addListener(() {
      print('scroll');
      print(_scrollController.offset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: padding),
                  child: Obx(() => Menu(
                        tabs: _pageSateCtr.tabs,
                        currentIdx: _pageSateCtr.pageIndex.value,
                        leftIconTap: leftIconTap,
                        rightIconTap: rightIconTap,
                        tabTap: tabTap,
                      ))),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: padding),
                      child: PageView.builder(
                          onPageChanged: (idx) {
                            _pageSateCtr.changePageIndex(idx);
                            print('idx' + idx.toString());
                          },
                          controller: _pageController,
                          itemCount: pages.length,
                          itemBuilder: itemBuilder))),
              NTabBar()
            ],
          )),
    );
  }

  void menuTap() {
    print('menu tap');
  }

  void searchTap() {
    print('search tap');
  }

  void tabTap(i) {
    _pageSateCtr.changePageIndex(i);
    _pageController.animateToPage(i,
        duration: Duration(milliseconds: 500),
        curve: Curves.fastLinearToSlowEaseIn);
    print('tab:' + i.toString());
  }

  Widget itemBuilder(BuildContext context, int index) {
    print('index:' + index.toString());
    return pages[index];
  }

  List<Widget> _buildPage(List<Widget> pages) {
    pages.add(HomePage());
    pages.add(VideoPage());
    pages.add(
      Center(
        child: Text("发现"),
      ),
    );
    pages.add(
      Center(
        child: Text("视频"),
      ),
    );
    return pages;
  }
// Widget page = SingleChildScrollView(

  leftIconTap() {}

  rightIconTap() {}
}
