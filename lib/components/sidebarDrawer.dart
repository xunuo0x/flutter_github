import 'package:flutter/material.dart';

class SidebarDraw extends StatefulWidget {
  @override
  _SidebarDrawState createState() => _SidebarDrawState();
}

class _SidebarDrawState extends State<SidebarDraw> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
      child: new ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            currentAccountPicture: new GestureDetector(
              child: CircleAvatar(
                backgroundImage: new NetworkImage('https://user-gold-cdn.xitu.io/2016/11/29/b702a124cd089ca0654ad74265ab3536?imageView2/1/w/180/h/180/q/85/format/webp/interlace/1')
              ),
            ),
            accountName: new Text('noopy'),
            accountEmail: new Text('noopyxu@qq.com')
          ),
          new ListTile(
            title: Text(
              '功能1',
              style: TextStyle(
                fontSize: 16.0
              ),
            ),
            trailing: Icon(
              Icons.navigate_next
            ),
          ),
          Divider(),
          new ListTile(
            title: Text(
              '功能2',
              style: TextStyle(
                fontSize: 16.0
              ),
            ),
            trailing: Icon(
              Icons.navigate_next
            ),
          ),
        ],
      ),
    );
  }
}