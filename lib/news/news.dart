import 'package:flutter/material.dart';
import 'package:flutter_app/news/searchBox.dart';
import 'package:flutter_app/news/tabBar.dart';
import 'package:flutter_app/news/tabBarContent.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List channels = [];
  _getChannels() async {
    setState(() {
      channels = [
        {
          "name": "微信精选",
          "nameid": "wxnew",
        },
        {
          "name": "IT资讯",
          "nameid": "it",
        },
        {
          "name": "动漫资讯",
          "nameid": "dongman",
        },
        {
          "name": "人工智能",
          "nameid": "ai",
        },
        {
          "name": "区块链",
          "nameid": "blockchain",
        },
        {
          "name": "苹果新闻",
          "nameid": "apple",
        },
        {
          "name": "体育新闻",
          "nameid": "tiyu",
        },
        {
          "name": "足球新闻",
          "nameid": "football",
        },
        {
          "name": "NBA新闻",
          "nameid": "nba",
        },
        {
          "name": "CBA新闻",
          "nameid": "cba",
        },
        {
          "name": "娱乐新闻",
          "nameid": "huabian",
        },
        {
          "name": "社会新闻",
          "nameid": "social",
        },
        {
          "name": "国际新闻",
          "nameid": "world",
        },
        {
          "name": "国内新闻",
          "nameid": "guonei",
        },
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    _getChannels();
  }

  @override
  Widget build(BuildContext context) {
    return channels.length == 0
        ? SizedBox()
        : DefaultTabController(
            length: channels.length,
            child: Scaffold(
              appBar: AppBar(
                title: SearchBox(),
                elevation: 0,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(50.0),
                  child: TabBarBtn(channels),
                ),
              ),
              body: TabBarView(
                children: channels.map((val) {
                  return TabBarContent(val['nameid']);
                }).toList(),
              ),
            ),
          );
  }
}
