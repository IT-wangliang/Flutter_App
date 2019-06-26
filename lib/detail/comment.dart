import 'package:flutter/material.dart';

class Commnet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 30,
                height: 30,
                child: CircleAvatar(
                  backgroundColor: Colors.red,
                  backgroundImage: NetworkImage(
                      'https://gss3.bdstatic.com/7Po3dSag_xI4khGkpoWK1HF6hhy/baike/c0%3Dbaike150%2C5%2C5%2C150%2C50/sign=cebf65693fd3d539d53007915bee8235/203fb80e7bec54e731845f89b0389b504fc26a38.jpg'),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text('王小帅'),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        '王小帅最最最最帅!!!',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.thumb_up,
                color: Colors.orangeAccent,
              ),
              Text('12')
            ],
          ),
          Divider(),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  height: 30,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black12,
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: '评论',
                      contentPadding: EdgeInsets.only(
                        left: 10,
                        top: 0,
                        right: 0,
                        bottom: 0,
                      ),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                    onSubmitted: (val) {
                      print(val);
                    },
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.share),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.message),
              ),
            ],
          )
        ],
      ),
    );
  }
}
