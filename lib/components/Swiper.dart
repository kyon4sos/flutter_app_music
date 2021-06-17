import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Swiper extends StatefulWidget {
  @override
  _SwiperState createState() => _SwiperState();
}

class _SwiperState extends State<Swiper> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late PageController _pageController;
  int pageIndex = 0;
  late Timer _timer;

  List<String> _items = [
    "https://alifei04.cfp.cn/creative/vcg/veer/800water/veer-303764513.jpg",
    "https://t7.baidu.com/it/u=1951548898,3927145&fm=193&f=GIF",
    "https://t7.baidu.com/it/u=1831997705,836992814&fm=193&f=GIF",
    "https://t7.baidu.com/it/u=2405382010,1555992666&fm=193&f=GIF",
    "https://t7.baidu.com/it/u=2582370511,530426427&fm=193&f=GIF",
    "https://alifei04.cfp.cn/creative/vcg/veer/800water/veer-303764513.jpg"
  ];
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _pageController = PageController(initialPage: pageIndex);
    _timer = setInterval();
  }

  Timer setInterval() {
    return Timer.periodic(Duration(milliseconds: 1000), (timer) {
      if (pageIndex < _items.length - 1) {
        pageIndex++;
        _pageController.nextPage(
            duration: Duration(milliseconds: 500), curve: SawTooth(1));
      } else {
        pageIndex = 0;
        _pageController.jumpToPage(pageIndex);
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 150,
              child: PageView.builder(
                itemCount: _items.length,
                controller: _pageController,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(_items[index],
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _buildSlider(),
              ),
            )
          ],
        ));
  }

  List<Widget> _buildSlider() {
    List<Widget> _widgets = [];
    for (var i = 0; i < _items.length; i++) {
      _widgets.add(GestureDetector(
        child: Container(
          margin: EdgeInsets.only(right: 10),
          child: Icon(
            Icons.circle,
            color: pageIndex == i ? Colors.red : Colors.grey,
            size: 10,
          ),
        ),
        onTap: () {
          setState(() {
            _timer.cancel();
            pageIndex = i;
          });
          _pageController.jumpToPage(pageIndex);
          if (!_timer.isActive) {
            _timer = Timer(Duration(milliseconds: 1000), () {
              _timer = setInterval();
            });
          }
        },
      ));
    }
    return _widgets;
  }
}
