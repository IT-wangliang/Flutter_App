import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _keyWord = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextField(
                  autofocus: true,
                  onChanged: (val) {
                    setState(() {
                      _keyWord = val;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: '请输入搜索内容',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 0,
                      vertical: 6,
                    ),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ),
            FlatButton(
              onPressed: () {},
              child: Text(
                '取消',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.normal,
                ),
              ),
            )
          ],
        ),
      ),
      body: _keyWord == ''
          ? SearchHistory()
          : ListView(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.search,
                    color: Colors.grey,
                    size: 20.0,
                  ),
                  title: Text('三生三世十里桃花'),
                  onTap: () {},
                ),
                Divider()
              ],
            ),
    );
  }
}

class SearchHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                '搜索历史',
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Icon(
                Icons.delete,
                color: Colors.black45,
                size: 20.0,
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Wrap(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width / 2 - 10,
                child: Center(
                  child: Text('123'),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.grey),
                    top: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width / 2 - 10,
                child: Center(
                  child: Text('123'),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.grey),
                    top: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width / 2 - 10,
                child: Center(
                  child: Text('123'),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.grey),
                    top: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width / 2 - 10,
                child: Center(
                  child: Text('123'),
                ),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(color: Colors.grey),
                    top: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              Divider(
                color: Colors.grey,
              )
            ],
          ),
        )
      ],
    );
  }
}
