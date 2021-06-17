import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/HotRank.dart';
import 'package:flutter_application_1/components/NCard.dart';
import 'package:flutter_application_1/components/NavMenu.dart';
import 'package:flutter_application_1/components/Swiper.dart';
import 'package:flutter_application_1/controller/music_controller.dart';
import 'package:flutter_application_1/model/nav_item.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  List<NavItem> navList = NavItem.buildNav();
  final MusicController _musicController = Get.put(MusicController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Swiper(),
          NavMenu(navList),
          NCard(
            child: HotRank(
              list: _musicController.musics,
            ),
            title: "推荐歌单",
            icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
            actionName: "查看更多",
          ),
          NCard(
            child: HotRank(list: _musicController.musics),
            title: "专属场景歌单",
            icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.grey),
            actionName: "查看更多",
          ),
        ],
      ),
    );
  }
}
