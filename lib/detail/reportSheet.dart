import 'package:flutter/material.dart';

class ReportSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Text('广告'),
          ),
          Divider(color: Colors.black26),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text('重复、旧闻'),
          ),
          Divider(color: Colors.black26),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text('格式问题'),
          ),
          Divider(color: Colors.black26),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text('低俗'),
          ),
          Divider(color: Colors.black26),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text('标题夸张'),
          ),
          Divider(color: Colors.black26),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text('疑似抄袭'),
          ),
          Divider(color: Colors.black26),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text('取消'),
          ),
          Divider(color: Colors.black26),
        ],
      ),
    );
  }
}
