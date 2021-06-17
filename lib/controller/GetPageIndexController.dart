import 'package:get/get.dart';
import 'package:dio/dio.dart';

class GetPageIndexController extends GetxController {
  List<String> tabs = ['我的', '云村', '发现', '视频'];
  var pageIndex = 1.obs;
  var tabIndex = 1.obs;
  changePageIndex(idx) {
    print("getx change:" + idx.toString());
    pageIndex.value = idx;
    print(pageIndex);
    return pageIndex;
  }

  changeTabIndex(idx) {
    return tabIndex = RxInt(idx);
  }
}
