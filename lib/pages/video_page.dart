import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/GetPageIndexController.dart';
import 'package:flutter_application_1/controller/music_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoPage extends StatefulWidget {
  @override
  _VideoPageState createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage>
    with SingleTickerProviderStateMixin {
  final GetPageIndexController _pageSateCtr = Get.put(GetPageIndexController());
  final MusicController _musicController = Get.put(MusicController());
  late VideoPlayerController _videoPlayerController;
  late AnimationController _animationController;
  List<Widget> tabs = [];
  List<String> videos = [
    "https://6e6f-note-9gpvzagz1944b75f-1258879474.tcb.qcloud.la/348870877_nb2-1-16.mp4",
    "https://6e6f-note-9gpvzagz1944b75f-1258879474.tcb.qcloud.la/351708092-1-16.mp4"
  ];
  List<VideoPlayerController> _videoCtrlList = [];
  late TabController _tabController;

  var _scrollController = PageController();
  @override
  void initState() {
    super.initState();
    _buildTabItems();
    // _animationController = AnimationController(vsync: this);
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.animation!.addListener(() {
      print("滚动");
    });
    _tabController.animation!.addStatusListener((status) {
      print("status滚动");
    });
    _tabController.addListener(() {
      _pageSateCtr.changeTabIndex(_tabController.index);
      print(_tabController.index);
      if (_tabController.index == tabs.length - 1) {
        print("到底了");
      }
      print(_tabController.index.toString());
    });
    _scrollController.addListener(() {
      print("page 滚动");
    });
    videos.forEach((element) {
      var _video = VideoPlayerController.network(element)
        ..initialize().then((_) => setState(() {}));
      _videoCtrlList.add(_video);
    });
    // _videoPlayerController = VideoPlayerController.network(
    //     'https://6e6f-note-9gpvzagz1944b75f-1258879474.tcb.qcloud.la/348870877_nb2-1-16.mp4')
    //   ..initialize().then((_) {
    //     // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
    //     setState(() {});
    //   });
  }

  @override
  void dispose() {
    super.dispose();
    _videoPlayerController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        Container(
          alignment: Alignment.center,
          height: 50,
          child: TabBar(
              unselectedLabelColor: Colors.black87,
              labelPadding: EdgeInsets.only(bottom: 8),
              labelColor: Colors.red,
              tabs: tabs,
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              onTap: (idx) {
                _pageSateCtr.changeTabIndex(idx);
              }),
        ),
        Expanded(
          child: GestureDetector(
            onTap: drag,
            child: TabBarView(
                controller: _tabController, children: _tabBarViewBuild()),
          ),
        )
        // Expanded(child: ListView.builder(itemBuilder: itemBuilder)),
      ],
    ));
  }

  _tabBarViewBuild() {
    return [
      // Container(
      //     height: 260,
      //     child: ListView.builder(
      //       itemBuilder: itemBuilder,
      //       controller: _scrollController,
      //     )),
      Container(
          height: 260,
          child: ListView.builder(
              itemCount: videos.length, itemBuilder: itemBuilder)),

      Center(child: Text("现场")),
      Center(child: Text("翻唱")),
      Center(child: Text("舞蹈")),
      Center(child: Text("广场")),
      // Container(height: 260, child: ListView.builder(itemBuilder: itemBuilder)),
      // Container(height: 260, child: ListView.builder(itemBuilder: itemBuilder)),
      // Container(height: 260, child: ListView.builder(itemBuilder: itemBuilder)),
    ];
  }

  Widget itemBuilder(BuildContext context, int index) {
    return Container(
        color: Colors.white,
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.only(top: 12),
        height: 360,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: _videoCtrlList[index].value.isInitialized
                      ? AspectRatio(
                          aspectRatio: _videoCtrlList[index].value.aspectRatio,
                          child: VideoPlayer(_videoCtrlList[index]),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          alignment: Alignment.center,
                          height: 200,
                          child: FaIcon(
                            FontAwesomeIcons.spinner,
                            color: Colors.grey,
                          ),
                        ),
                ),
                Container(
                  child: IconButton(
                    onPressed: () {
                      setState(() {});
                      if (_videoCtrlList[index].value.isPlaying) {
                        _videoCtrlList[index].pause();
                      } else {
                        _videoCtrlList.forEach((element) {
                          element.pause();
                        });
                        _videoCtrlList[index].play();
                      }
                    },
                    icon: _videoCtrlList[index].value.isPlaying
                        ? Icon(
                            Icons.pause,
                            color: Colors.white,
                          )
                        : Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                          ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text("游事齐宣王，宣王不能用。适梁，梁惠王不果所言，则见以为迂远而阔于事情"),
            ),
            Container(
              height: 80,
              decoration: BoxDecoration(
                  border: Border(
                      top: BorderSide(
                          color: Colors.black12,
                          width: 1,
                          style: BorderStyle.solid))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: Image.network(
                                "https://pics2.baidu.com/feed/b64543a98226cffcaa9bbee9f1799a96f703eab3.jpeg?token=99bafe934f8d5948be9b5cacfd50c5e5")
                            .image,
                      ),
                      Padding(padding: EdgeInsets.only(right: 10)),
                      Text("音乐云智能推荐"),
                    ],
                  ),
                  Container(
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.favorite_border),
                            color: Colors.grey,
                            onPressed: () {}),
                        IconButton(
                            icon: Icon(Icons.comment_outlined),
                            color: Colors.grey,
                            onPressed: () {}),
                        IconButton(
                            icon: Icon(Icons.arrow_forward_ios_outlined),
                            color: Colors.grey,
                            onPressed: () {}),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget tabItem(String label) {
    return Text(label, style: TextStyle(fontSize: 20));
  }

  void _buildTabItems() {
    tabs.add(tabItem("推荐"));
    tabs.add(tabItem("现场"));
    tabs.add(tabItem("翻唱"));
    tabs.add(tabItem("舞蹈"));
    tabs.add(tabItem("广场"));
  }

  void drag() {
    print(" details");
  }
}

class MultiMediaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Container(),
            ),
          )
        ],
      ),
    );
  }
}
