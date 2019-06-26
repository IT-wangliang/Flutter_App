import 'package:flutter/material.dart';
import 'package:flutter_app/news/news.dart';
import 'package:flutter_app/question/question.dart';
import 'package:flutter_app/user/user.dart';
import 'package:flutter_app/video/video.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;
  List _body = [
    News(),
    Question(),
    Video(),
    User(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body[_index],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _index = index;
          });
        },
        currentIndex: _index,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.question_answer),
            title: Text('问答'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_label),
            title: Text('视频'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            title: Text('我的'),
          ),
        ],
      ),
    );
  }
}
