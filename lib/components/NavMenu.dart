import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/model/nav_item.dart';

class NavMenu extends StatelessWidget {
  final List<NavItem> itemList;
  NavMenu(this.itemList);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: _buildNavItem(),
      ),
    );
  }

  List<Widget> _buildNavItem() {
    List<Widget> _list = [];
    for (var item in itemList) {
      _list.add(Column(
        children: [
          item.icon,
          Padding(padding: EdgeInsets.only(top: 8)),
          Text(item.label)
        ],
      ));
    }
    return _list;
  }
}
