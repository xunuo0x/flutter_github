import 'package:flutter/material.dart';

import './tabbarpage.dart';

class PageOne extends StatefulWidget {
  @override
  _PageOneState createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {

  static SlideTransition createTransition(Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: const Offset(0.0, 0.0),
    ).animate(animation),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Center(
          child: GestureDetector(
            child: Card(
              child: Padding(
                child: Text('jump'),
                padding: EdgeInsets.all(16.0),
              )
            ),
            onTap: () {
              Navigator.push<String>(context,
                new PageRouteBuilder(pageBuilder: (BuildContext context,
                    Animation<double> animation,
                    Animation<double> secondaryAnimation) {
                    // 跳转的路由对象
                    return new TabbarPage(appBarTitle: '详情',);
                    }, transitionsBuilder: (
                      BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child,
                    ) {
                      return _PageOneState.createTransition(animation, child);
                    },
                    transitionDuration: Duration(milliseconds: 350)
                  ),
                );
            },
          )
        )
      )
    );
  }
}