import 'package:flutter/material.dart';
import 'package:flutter_app/login.dart';
import 'package:flutter_app/module/pub.dart';
import 'package:flutter_app/news/news.dart';
import 'package:flutter_app/question/question.dart';
import 'package:flutter_app/user/user.dart';
import 'Home.dart';
import 'detail/detail.dart';

void main() {
  PubModale.checkuser().then((res) {
    runApp(App(res));
  });
}

class App extends StatelessWidget {
  final String token;
  App(this.token);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Uki',
      home: token != '' ? Home() : LoginPage(),
      routes: {
        '/home': (context) => Home(),
        '/news': (context) => News(),
        '/question': (context) => Question(),
        '/uesr': (context) => User(),
      },
    );
  }
}
