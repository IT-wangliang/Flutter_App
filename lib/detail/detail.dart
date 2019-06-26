import 'package:flutter/material.dart';
import 'package:flutter_app/detail/shareSheet.dart';
import 'package:flutter_app/module/pub.dart';
import 'package:flutter_html/flutter_html.dart';

import 'comment.dart';

class NewsDetail extends StatefulWidget {
  final String url;
  NewsDetail(this.url);

  @override
  _NewsDetailState createState() => _NewsDetailState();
}

class _NewsDetailState extends State<NewsDetail> {
  var _detail;
  _getDatail() async {
    var url =
        'http://api.tianapi.com/txapi/toutiaotxt/?key=ff0326cdc30c19360a682727a275e4eb&url=' +
            'https://www.toutiao.com/a${widget.url}/';
    var data = await PubModale.httpRequest('get', url);
    if (this.mounted) {
      setState(() {
        _detail = data.data['newslist'][0];
      });
    }
  }

  @override
  void initState() {
    if (this.mounted) {
      super.initState();
      _getDatail();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _detail == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: Text(_detail['title']),
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(Icons.more_horiz),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext context) {
                              return ShareSheet();
                            });
                      },
                    )
                  ],
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      child: Text(
                        _detail['title'],
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ]),
                ),
                MediaQuery.removePadding(
                  context: context,
                  removeBottom: true,
                  child: SliverPersistentHeader(
                    pinned: true,
                    delegate: _SliverAppBarDelegate(
                      childBar: AppBar(
                        brightness: Brightness.light,
                        elevation: 0,
                        title: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  SizedBox(
                                    width: 40,
                                    height: 40,
                                    child: GestureDetector(
                                      onTap: null,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          'https:' + _detail['avatar'],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        _detail['source'],
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        backgroundColor: Color.fromRGBO(247, 247, 247, 1),
                        leading: Container(
                          child: IconButton(
                            icon: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        actions: <Widget>[
                          IconButton(
                            icon: Icon(Icons.more_horiz),
                            color: Colors.grey,
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ShareSheet();
                                  });
                            },
                          ),
                        ],
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: GestureDetector(
                                    onTap: null,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          'https:' + _detail['avatar']),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      _detail['source'],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            RaisedButton.icon(
                              icon: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              label: Text('关注',
                                  style: TextStyle(color: Colors.white)),
                              elevation: 0,
                              color: Colors.blue,
                              onPressed: () {
                                print('点击了按钮4');
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
                      child: Html(
                        data: _detail['content'],
                        padding: EdgeInsets.all(8.0),
                        backgroundColor: Colors.white70,
                        defaultTextStyle:
                            TextStyle(fontFamily: 'serif', fontSize: 16),
                        linkStyle: const TextStyle(
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '猜你喜欢',
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Wrap(
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(bottom: 10.0),
                                width:
                                    MediaQuery.of(context).size.width / 2 - 20,
                                child: Text(
                                  '李凯馨',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10.0),
                                width:
                                    MediaQuery.of(context).size.width / 2 - 20,
                                child: Text(
                                  '迪丽热巴',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10.0),
                                width:
                                    MediaQuery.of(context).size.width / 2 - 20,
                                child: Text(
                                  '石原里美',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 10.0),
                                width:
                                    MediaQuery.of(context).size.width / 2 - 20,
                                child: Text(
                                  '杨幂',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        GestureDetector(
                          onTap: null,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                                color: Colors.red,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.thumb_up,
                                  color: Colors.red,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '点赞',
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: null,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 2,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Row(
                              children: <Widget>[
                                Icon(Icons.delete),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '不喜欢',
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Commnet()
                  ]),
                ),
              ],
            ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({this.child, this.childBar});
  final Widget child;
  final Widget childBar;

  @override
  double get minExtent => 80.0;

  @override
  double get maxExtent => 80.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    if (shrinkOffset > 0) {
      return SizedBox(
        child: childBar,
      );
    } else {
      return SizedBox(
        child: child,
      );
    }
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
