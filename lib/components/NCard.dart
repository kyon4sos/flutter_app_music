import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NCard extends StatelessWidget {
  final String? title;
  final Icon? icon;
  final String actionName;
  final Function? action;
  final Widget? child;
  NCard({this.child, this.title, this.icon, this.actionName = "", this.action});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title!, style: TextStyle(fontSize: 24.w)),
              GestureDetector(
                onTap: () {
                  action!();
                },
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      actionName,
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.grey),
                    ),
                    icon!,
                  ],
                )),
              )
            ],
          ),
          Padding(padding: EdgeInsets.only(bottom: 16)),
          child!,
        ],
      ),
    );
  }
}
