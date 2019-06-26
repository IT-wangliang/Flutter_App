import 'package:flutter/material.dart';
import 'package:flutter_app/module/pub.dart';

class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  List _userChannel = [];
  List _allChannel = [];
  bool isEdit = false;
  // 获取用户频道
  _getUserChannel() async {
    // 数据持久化
    setState(() {
      _userChannel = [
        {"name": "IT资讯", "nameid": "it"},
        {"name": "动漫资讯", "nameid": "dongman"},
        {"name": "人工智能", "nameid": "ai"},
        {"name": "区块链", "nameid": "blockchain"},
        {"name": "苹果新闻", "nameid": "apple"},
        {"name": "体育新闻", "nameid": "tiyu"},
        {"name": "足球新闻", "nameid": "football"},
      ];
    });
  }

  // 获取所有频道
  _getAllChannerl() async {
    var url =
        'http://api.tianapi.com/channellist?key=ff0326cdc30c19360a682727a275e4eb';
    var data = await PubModale.httpRequest('get', url);
    setState(() {
      _allChannel = data.data['newslist'];
    });
  }

  // 获取用户信息
  _getUserInfo() {}

  @override
  void initState() {
    super.initState();
    _getUserChannel();
    _getAllChannerl();
    _getUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          DrawerHeader(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Center(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    width: 60.0,
                    height: 60.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          'http://5b0988e595225.cdn.sohucs.com/images/20171030/26ed195281334ba4b1752394b60eb29a.jpeg'),
                    ),
                  ),
                  Text(
                    '王小帅',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: Text(
              '我的频道',
            ),
            trailing: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 2.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                ),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isEdit = !isEdit;
                  });
                },
                child: Text(
                  isEdit ? '保存' : '编辑',
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 5,
            ),
            child: Wrap(
              spacing: 10.0,
              children: _userChannel.map((val) {
                return Chip(
                  label: Text(val['name']),
                  onDeleted: isEdit
                      ? () {
                          setState(() {
                            _userChannel.remove(val);
                          });
                        }
                      : null,
                );
              }).toList(),
            ),
          ),
          ListTile(
            title: Text('频道推荐'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 5,
            ),
            child: Wrap(
              spacing: 15.0,
              children: _allChannel.map((val) {
                return FilterChip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text(
                      '+',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  label: Text(val['name']),
                  onSelected: (status) {
                    setState(() {
                      _allChannel.remove(val);
                      _userChannel.add(val);
                    });
                  },
                );
              }).toList(),
            ),
          )
        ],
      ),
    );
  }
}
