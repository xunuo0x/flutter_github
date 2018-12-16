import 'package:flutter/material.dart';

import '../model/news.dart';

import './tabbarpage.dart';

class ItemCard extends StatefulWidget {

  final News news;

  ItemCard({ Key key, this.news }) : super(key: key);

  @override
  _ItemCardState createState() => _ItemCardState(news);
}

class _ItemCardState extends State<ItemCard> {

  final News news;

  _ItemCardState(this.news);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.teal.shade500,
            foregroundColor: Colors.white,
            child: Text(this.news.author.substring(0,1)),
          ),
          title: Text(this.news.author),
          trailing: Text('8小时前',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black38
            ),
          ),
          subtitle: Text(
            this.news.repo,
            style: TextStyle(
              fontSize: 12.0
            ),
          ),
          onTap: (){
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
                  return _IndexPageState.createTransition(animation, child);
                }
              ),
            );
          },
        ),
        Divider(
          height: 4.0,
        )
      ],
    );
  }
}

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {

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
      body: ListView(
        children: <Widget>[
          ItemCard(news: new News('https://raw.githubusercontent.com/github/explore/6c6508f34230f0ac0d49e847a326429eefbfc030/topics/vue/vue.png', 'Vue','A progressive', '8小时前')),
          ItemCard(news: new News('https://raw.githubusercontent.com/github/explore/6c6508f34230f0ac0d49e847a326429eefbfc030/topics/react/react.png', 'React','A declarative, efficient','10小时前')),
          ItemCard(news: new News('https://raw.githubusercontent.com/github/explore/6c6508f34230f0ac0d49e847a326429eefbfc030/topics/vue/vue.png', 'Vue','A progressive', '8小时前')),
          ItemCard(news: new News('https://raw.githubusercontent.com/github/explore/6c6508f34230f0ac0d49e847a326429eefbfc030/topics/react/react.png', 'React','A declarative, efficient','10小时前')),
          ItemCard(news: new News('https://raw.githubusercontent.com/github/explore/6c6508f34230f0ac0d49e847a326429eefbfc030/topics/vue/vue.png', 'Vue','A progressive', '8小时前')),
          ItemCard(news: new News('https://raw.githubusercontent.com/github/explore/6c6508f34230f0ac0d49e847a326429eefbfc030/topics/react/react.png', 'React','A declarative, efficient','10小时前')),
          ItemCard(news: new News('https://raw.githubusercontent.com/github/explore/6c6508f34230f0ac0d49e847a326429eefbfc030/topics/vue/vue.png', 'Vue','A progressive', '8小时前')),
          ItemCard(news: new News('https://raw.githubusercontent.com/github/explore/6c6508f34230f0ac0d49e847a326429eefbfc030/topics/react/react.png', 'React','A declarative, efficient','10小时前')),
          ItemCard(news: new News('https://raw.githubusercontent.com/github/explore/6c6508f34230f0ac0d49e847a326429eefbfc030/topics/vue/vue.png', 'Vue','A progressive', '8小时前')),
          ItemCard(news: new News('https://raw.githubusercontent.com/github/explore/6c6508f34230f0ac0d49e847a326429eefbfc030/topics/react/react.png', 'React','A declarative, efficient','10小时前')),
        ],
      )
    );
  }
}