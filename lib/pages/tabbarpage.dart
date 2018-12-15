import 'package:flutter/material.dart';

class TabbarPage extends StatefulWidget {

  final String appBarTitle;

  TabbarPage({ Key key, this.appBarTitle }) : super(key: key);

  @override
  _TabbarPageState createState() => new _TabbarPageState(appBarTitle);
}

class _TabbarPageState extends State<TabbarPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  final String appBarTitle;
  
  _TabbarPageState(this.appBarTitle);

  @override
  void initState() {
    super.initState();
    print('initState');
    _tabController = new TabController(
      vsync: this,     //动画效果的异步处理，默认格式，背下来即可
      length: choices.length      //需要控制的Tab页数量
    );    
  }
  //当整个页面dispose时，记得把控制器也dispose掉，释放内存
  @override
  void dispose() {
    _tabController.dispose();
    print('dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
          title: Text(
            this.appBarTitle,
            style: TextStyle(
              fontSize: 16.0
            ),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.white,
            controller: _tabController,
            isScrollable: true,
            labelStyle: TextStyle(
              fontSize: 12.0
            ),
            tabs: choices.map((Choice choice) {
              return Tab(
                text: choice.title,
              );
            }).toList(),
          ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: choices.map((Choice choice) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ChoiceCard(choice: choice),
          );
        }).toList(),
      ),
    );
  }
}

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'CAR', icon: Icons.directions_car),
  const Choice(title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(title: 'BOAT', icon: Icons.directions_boat),
  const Choice(title: 'BUS', icon: Icons.directions_bus),
  const Choice(title: 'TRAIN', icon: Icons.directions_railway),
  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Card(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(choice.icon, size: 128.0, color: textStyle.color),
            Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}
