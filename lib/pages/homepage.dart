import 'package:flutter/material.dart';

// components
import '../components/sidebarDrawer.dart';
// pages
import './pageone.dart';
import './pagetwo.dart';
import './pagethree.dart';
import './tabbarpage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final List<Tab> _bottomTabs = <Tab>[
  new Tab(
    text: '动态',
    icon: new Icon(Icons.camera)
  ),    //icon和text的显示顺序已经内定，如需自定义，到child属性里面加吧
  new Tab(
    text: '趋势',
    icon: new Icon(Icons.timeline)
  ),
  new Tab(
    text: '我的',
    icon: new Icon(Icons.person_outline)
  ),
];

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin {

  TabController _bottomTabController;

  @override
  void initState() {
    super.initState();
    _bottomTabController = new TabController(
      vsync: this,     //动画效果的异步处理，默认格式，背下来即可
      length: _bottomTabs.length      //需要控制的Tab页数量
    );    
  }

  //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _bottomTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GGhub'
        ),
        centerTitle: true,
        actions: <Widget>[
          GestureDetector(
            child: Icon(
              Icons.search,
            ),
            onTap: () {
              print('search');
            },
          ),
          Padding(
            padding: EdgeInsets.only(right: 14.0),
          ),
        ],
      ),
      drawer: new SidebarDraw(),
      body: new TabBarView(
        physics: new NeverScrollableScrollPhysics(),
        controller: _bottomTabController,
        children: [
          new TabbarPage(),
          new PageTwo(),
          new PageThree(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        child: new TabBar(
          labelColor: Colors.teal,
          labelStyle: TextStyle(
            fontSize: 12.0
          ),
          unselectedLabelColor: Colors.grey,
          controller: _bottomTabController,
          tabs: _bottomTabs,
          indicatorColor: Colors.white
        ),
      ),
    );
  }
}