import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// components
import '../components/sidebarDrawer.dart';
// pages
import './indexpage.dart';
import './pagetwo.dart';
import './pagethree.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(
      Icons.camera
    ),
    title: Text(
      '动态',
      style: TextStyle(
        fontSize: 12.0
      ),
    )
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.timeline
    ),
    title: Text('趋势',
      style: TextStyle(
          fontSize: 12.0
      ),
    )
  ),
  BottomNavigationBarItem(
    icon: Icon(
      Icons.person_outline
    ),
    title: Text('我的',
      style: TextStyle(
          fontSize: 12.0
        ),
      )
  )
];

List<Widget> pages = List<Widget>(); 

class _HomePageState extends State<HomePage>  with SingleTickerProviderStateMixin {

  PageController _pageController;
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
    _pageController = PageController(
      initialPage: 0
    );
  }

  //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'GGhub',
          style: TextStyle(
            fontSize: 16.0
          ),
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
            padding: EdgeInsets.only(right: 12.0),
          ),
        ],
      ),
      drawer: new SidebarDraw(),
      body: new PageView(
        physics: new NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          new IndexPage(),
          new PageTwo(),
          new PageThree(),
        ],
      ),
      bottomNavigationBar: CupertinoTabBar(
        activeColor: Colors.teal,
        iconSize: 24,
        currentIndex: _currentIndex,
        items: _bottomTabs,
        onTap: (int index) {
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      )
      // new Material(
      //   color: Colors.white,
      //   child: new TabBar(
      //     labelColor: Colors.teal,
      //     labelStyle: TextStyle(
      //       fontSize: 12.0
      //     ),
      //     unselectedLabelColor: Colors.grey,
      //     controller: _bottomTabController,
      //     tabs: _bottomTabs,
      //     indicatorColor: Colors.white
      //   ),
      // ),
    );
  }
}