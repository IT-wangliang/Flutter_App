import 'package:flutter/material.dart';
import 'package:flutter_app/detail/reportSheet.dart';

class ShareSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.wallpaper),
                    Text('微信'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.wallpaper),
                    Text('QQ'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.wallpaper),
                    Text('微博'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.wallpaper),
                    Text('朋友圈'),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    Icon(Icons.settings),
                    Text('显示设置'),
                  ],
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return ReportSheet();
                        });
                  },
                  child: Column(
                    children: <Widget>[
                      Icon(Icons.error),
                      Text('举报'),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Text('取消'),
          )
        ],
      ),
    );
  }
}
