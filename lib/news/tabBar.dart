import 'package:flutter/material.dart';

class TabBarBtn extends StatelessWidget {
  final List channel;
  TabBarBtn(this.channel);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      child: TabBar(
          labelColor: Colors.black,
          labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
          labelStyle: TextStyle(
            fontSize: 16,
          ),
          indicatorColor: Colors.blueAccent,
          indicatorWeight: 3.0,
          indicatorSize: TabBarIndicatorSize.label,
          unselectedLabelColor: Colors.black45,
          isScrollable: true,
          tabs: channel.map((val) {
            return Tab(
              text: val['name'],
            );
          }).toList()),
    );
  }
}
