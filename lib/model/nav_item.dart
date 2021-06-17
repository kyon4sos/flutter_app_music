import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
class NavItem {
  Icon icon;
  String label;
  NavItem(this.label,this.icon);
  static List<NavItem> buildNav() {
    return [
      NavItem("每日推荐", Icon(Icons.watch_later_outlined,color: Colors.red,size: 40.w,)),
      NavItem("歌单", Icon(Icons.water_damage,color: Colors.red,size: 40.w,)),
      NavItem("排行榜", Icon(Icons.ac_unit,color: Colors.red,size: 40.w,)),
      NavItem("数字专辑", Icon(Icons.wifi_outlined,color: Colors.red,size: 40.w,)),
    ];
  }
}