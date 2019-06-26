import 'package:flutter/material.dart';
import 'package:flutter_app/detail/detail.dart';
import 'package:flutter_app/module/pub.dart';
import 'package:flutter_app/news/model/article.dart';
import 'package:timeago/timeago.dart' as timeago;

class TabBarContent extends StatefulWidget {
  final String nameid;
  TabBarContent(this.nameid);
  @override
  _TabBarContentState createState() => _TabBarContentState();
}

class _TabBarContentState extends State<TabBarContent> {
  List<Article> _list = [];
  ScrollController _controller = ScrollController();
  int _page = 1;
  _getData([type]) async {
    var url = 'http://api.tianapi.com/' +
        widget.nameid +
        '?key=ff0326cdc30c19360a682727a275e4eb&num=10&page=' +
        _page.toString();
    var data = await PubModale.httpRequest('get', url);
    List jsonList = data.data['newslist'];
    List<Article> listData =
        jsonList.map((val) => Article.fromJson(val)).toList();
    if (type == 1) {
      setState(() {
        _list.addAll(listData);
      });
    } else {
      setState(() {
        _list = listData;
      });
    }
  }

  //下拉刷新
  Future _refresh() async {
    _page = 1;
    _getData();
  }

  @override
  void initState() {
    if (this.mounted) {
      super.initState();
      _getData();
      // 添加上拉行为
      _controller.addListener(() {
        var maxScroll = _controller.position.maxScrollExtent;
        var pixels = _controller.position.pixels;
        if (maxScroll == pixels) {
          _page++;
          _getData(1);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _list.length == 0
        ? Center(
            child: CircularProgressIndicator(),
          )
        : RefreshIndicator(
            onRefresh: _refresh,
            child: Padding(
              padding: EdgeInsets.only(
                left: 10.0,
                right: 10.0,
              ),
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: NewsItem(_list[index]),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetail(_list[index].url),
                          ));
                    },
                  );
                },
                controller: _controller,
              ),
            ),
          );
  }
}

class NewsItem extends StatelessWidget {
  final Article article;
  NewsItem(this.article);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 5.0,
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    article.title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 35.0,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: article.description + '    ',
                          style: TextStyle(color: Colors.grey),
                        ),
                        TextSpan(
                          text: timeago.format(DateTime.parse(article.ctime)),
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            SizedBox(
              width: 100.0,
              height: 100.0,
              child: Image.network(
                article.picUrl,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Divider(
          height: 3.0,
        ),
      ],
    );
  }
}

// ListView(
//         children: <Widget>[
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 '罗永浩再谈收购苹果，看到评论笑开了花',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16.0,
//                 ),
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               RichText(
//                 text: TextSpan(
//                   text: '置顶  ',
//                   style: TextStyle(color: Colors.red),
//                   children: [
//                     TextSpan(
//                       text: '小超科技君  ',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     TextSpan(
//                       text: '18评论  ',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     TextSpan(
//                       text: '10分钟前  ',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           Divider(
//             height: 3.0,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Text(
//                 '7000位程序员揭秘2019软件开发现状，python最抢手、Go最有前途',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 16.0,
//                 ),
//               ),
//               SizedBox(
//                 height: 10.0,
//               ),
//               Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: AspectRatio(
//                       aspectRatio: 1 / 1,
//                       child: Image.network(
//                         'http://p9.pstatp.com/large/pgc-image/0e1b390f500d42bc98b3b67b5165d622',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: AspectRatio(
//                       aspectRatio: 1 / 1,
//                       child: Image.network(
//                         'http://p3.pstatp.com/large/pgc-image/35cb616fe4184dd2b01bf0a52b937906',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: AspectRatio(
//                       aspectRatio: 1 / 1,
//                       child: Image.network(
//                         'http://p9.pstatp.com/large/pgc-image/18b61d2dc7414c629b38e18bc51bf2c4',
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: 5,
//               ),
//               RichText(
//                 text: TextSpan(
//                   text: '置顶  ',
//                   style: TextStyle(color: Colors.red),
//                   children: [
//                     TextSpan(
//                       text: '程序三剑客  ',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     TextSpan(
//                       text: '188评论  ',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                     TextSpan(
//                       text: '12分钟前  ',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           Divider(
//             height: 3.0,
//           ),
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: <Widget>[
//               Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       mainAxisAlignment: MainAxisAlignment.spaceAround,
//                       children: <Widget>[
//                         Text(' 滴滴平台“扩容”网约车行业为何“偏爱”聚合模式？'),
//                         SizedBox(
//                           height: 35.0,
//                         ),
//                         RichText(
//                           text: TextSpan(
//                             text: '置顶  ',
//                             style: TextStyle(color: Colors.red),
//                             children: [
//                               TextSpan(
//                                 text: '17看科技  ',
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                               TextSpan(
//                                 text: '20评论  ',
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                               TextSpan(
//                                 text: '12分钟前  ',
//                                 style: TextStyle(color: Colors.grey),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     width: 100.0,
//                     height: 100.0,
//                     child: Image.network(
//                       'http://p1.pstatp.com/large/1e0680006c26cc3d8a48a',
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           Divider(
//             height: 3.0,
//           ),
//         ],
//       ),
