import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:flutter_application_1/model/music.dart';
import 'package:get/get.dart';

class HotRank extends StatelessWidget {
  List<Music> list = [];
  HotRank({required this.list});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 170,
        child: Obx(() => list.isEmpty
            ? Text(
                "暂无数据",
                style: TextStyle(color: Colors.grey),
              )
            : ListView.builder(
                itemCount: list.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: itemBuilder)));
  }

  Widget itemBuilder(BuildContext context, int index) {
    return Container(
      width: 100,
      margin: EdgeInsets.only(right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: list.isNotEmpty
                ? Image.network(
                    list[index].picurl!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                  )
                : Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey,
                  ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8),
            alignment: Alignment.center,
            child: Text(
              list[index].name!,
              textAlign: TextAlign.center,
              maxLines: 2,
              style: TextStyle(fontSize: 12.w, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}
