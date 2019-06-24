import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app/Home.dart';
import 'package:flutter_app/module/pub.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text('登录'),
        ),
        elevation: 0,
      ),
      body: Container(
        color: Colors.grey[100],
        child: FormWidget(),
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  @override
  _FormWidgetState createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  String phone = '';
  String smsCode = '';
  String _verifyStr = '获取验证码';
  int _seconds = 0;
  Timer _timer;

  _login() async {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('登录成功'),
      ),
    );
    // 数据持久化
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', 'tokenABCD');
    Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
  }

  _getSmsCode() async {
    // 开启倒计时
    if (_seconds == 0 && phone != '') {
      _startTimer();
      // 请求接口
      PubModale.httpRequest('get', 'http://www.baidu.com').then((res) {
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text('验证码已发送'),
        ));
      });
    }
  }

  _startTimer() {
    _seconds = 10;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_seconds == 0) {
        _canceTimer();
        return;
      }
      _seconds--;
      setState(() {
        if (_seconds == 0) {
          _verifyStr = '重新获取验证码';
        } else {
          _verifyStr = '$_seconds(s)';
        }
      });
    });
  }

  _canceTimer() {
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 5.0,
          ),
          child: TextField(
            onChanged: (val) {
              setState(() {
                phone = val;
              });
            },
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                hintText: '请输入手机号',
                hintStyle: TextStyle(
                  color: Colors.black38,
                  fontSize: 14.0,
                ),
                prefixIcon: Icon(
                  Icons.mobile_screen_share,
                  color: Colors.grey,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                )),
          ),
        ),
        Container(
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5.0,
                  ),
                  child: TextField(
                    onChanged: (val) {
                      setState(() {
                        smsCode = val;
                      });
                    },
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        hintText: '请输入验证码',
                        hintStyle: TextStyle(
                          color: Colors.black38,
                          fontSize: 14.0,
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.grey,
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide.none,
                        )),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _getSmsCode();
                  });
                },
                child: Container(
                  width: 110,
                  height: 30,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(237, 237, 237, 1),
                    borderRadius: BorderRadius.circular(120.0),
                  ),
                  child: Text(_verifyStr),
                ),
              ),
              SizedBox(
                width: 10.0,
              )
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          width: double.infinity,
          height: 45.0,
          margin: EdgeInsets.only(top: 20.0),
          child: RaisedButton(
            onPressed: phone == '' || smsCode == ''
                ? null
                : () {
                    _login();
                  },
            // onPressed: null,
            child: Text(
              '登录',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            elevation: 0,
            color: Colors.blue,
            disabledColor: Colors.blue[200],
          ),
        ),
      ],
    );
  }
}
