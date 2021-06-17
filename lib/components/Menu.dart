import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class Menu extends StatefulWidget {
//
//   List<String> tabs;
//   Function tabTap;
//   Function leftIconTap;
//   Function rightIconTap;
//
//   Menu({this.tabs});
//
//   @override
//   State<StatefulWidget> createState() => _MenuState(
//       tabs: this.tabs,
//       tabTap: this.tabTap,
//       rightIconTap: this.rightIconTap,
//       leftIconTap: this.rightIconTap);
// }

class Menu extends StatelessWidget {
  var currentIdx = 0;
  List<String> tabs = [];
  Function tabTap;
  Function? leftIconTap;
  Function? rightIconTap;

  Menu(
      {required this.tabs,
      required this.currentIdx,
      required this.tabTap,
      this.leftIconTap,
      this.rightIconTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _buildTabs(
            currentIdx: currentIdx,
            tabs: tabs,
            tabTap: tabTap,
            rightIconTap: rightIconTap,
            leftIconTap: leftIconTap),
      ),
    );
  }

  List<Widget> _buildTabs(
      {required List<String> tabs,
      currentIdx,
      tabTap,
      rightIconTap,
      leftIconTap}) {
    print('_buildTabs');
    List<Widget> _list = [];
    _list.add(Container(
        child: IconButton(
      alignment: Alignment.centerLeft,
      icon: Icon(Icons.menu),
      onPressed: rightIconTap,
    )));
    for (int i = 0; i < tabs.length; i++) {
      _list.add(GestureDetector(
        child: Container(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: AnimatedDefaultTextStyle(
              child: Container(
                child: Text(
                  tabs[i],
                ),
              ),
              style: switchTextStyle(currentIdx, i),
              curve: Curves.linear,
              textAlign: TextAlign.center,
              duration: Duration(milliseconds: 200)),
        ),
        onTap: () {
          onChange(i);
          tabTap(i);
        },
      ));
    }
    _list.add(Container(
        child: IconButton(
      alignment: Alignment.centerRight,
      icon: Icon(Icons.search),
      onPressed: leftIconTap,
    )));
    return _list;
  }

  void onChange(int i) {
    currentIdx = i;
  }

  TextStyle switchTextStyle(int cur, int i) {
    return cur == i
        ? TextStyle(
            fontSize: 24, color: Colors.black, fontWeight: FontWeight.w600)
        : TextStyle(fontSize: 20, color: Colors.grey);
  }
}
