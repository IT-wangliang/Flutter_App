import 'package:flutter/material.dart';
import 'package:flutter_app/module/pub.dart';

class User extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('个人中心'),
        ),
        body: Container(
          child: Center(
            child: RaisedButton(
              onPressed: () {
                PubModale.removeToken();
              },
              child: Text('清除Token'),
            ),
          ),
        ));
  }
}
