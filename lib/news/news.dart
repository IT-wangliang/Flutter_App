import 'package:flutter/material.dart';
import 'package:flutter_app/news/searchBox.dart';
import 'package:flutter_app/news/tabBar.dart';
import 'package:flutter_app/news/tabBarContent.dart';
import 'drawerList.dart';

class News extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> {
  List channels = [];
  _getChannels() async {
    setState(() {
      channels = [
        {'name': '推荐', 'nameid': '__all__'},
        {'name': '热点', 'nameid': 'news_hot'},
        {'name': '社会', 'nameid': 'news_society'},
        {'name': '娱乐', 'nameid': 'news_entertainment'},
        {'name': '科技', 'nameid': 'news_tech'},
        {'name': '汽车', 'nameid': 'news_car'},
        {'name': '体育', 'nameid': 'news_sports'},
        {'name': '财经', 'nameid': 'news_finance'},
        {'name': '军事', 'nameid': 'news_military'},
        {'name': '国际', 'nameid': 'news_world'},
        {'name': '时尚', 'nameid': 'news_fashion'},
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
              drawer: DrawerList(),
            ),
          );
  }
}
