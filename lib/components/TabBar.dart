import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NTabBar extends StatelessWidget {
  final List<dynamic> tabs = [];

  NTabBar({tabs});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
      ),
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: <Widget>[
              Icon(Icons.account_tree, color: Colors.grey),
              Text("圈子", style: TextStyle(color: Colors.grey))
            ],
          ),
          Column(
            children: <Widget>[
              Icon(Icons.account_circle_outlined, color: Colors.grey),
              Text("我的", style: TextStyle(color: Colors.grey))
            ],
          ),
        ],
      ),
    );
  }


}
