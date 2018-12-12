import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class ItemCard extends StatelessWidget {

  _getBottomItem(IconData icon, String text) {
    return new Expanded(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Icon(
            icon,
            color: Colors.grey,
            size: 16.0,
          ),
          new Padding(
            padding: EdgeInsets.only(left: 5.0),
          ),
          new Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey
            ),
          ),
        ],
      )
    );
  }
  

  @override
  Widget build(BuildContext context) {
    return new Card(
      margin: const EdgeInsets.all(10.0),
      child: FlatButton(
        onPressed: (){
          print('click');
        },
        child: new Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(top: 10.0),
              child: Text('title', style: TextStyle(color: Colors.blueAccent, fontSize: 20.0),),
            ),
            new Padding(padding: EdgeInsets.all(10.0)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                _getBottomItem(Icons.star, '1000'),
                _getBottomItem(Icons.insert_link, '1000'),
                _getBottomItem(Icons.subject, '1000'),
              ],
            ),
            new Padding(padding: EdgeInsets.only(bottom: 5.0)),
          ],
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.list,
          size: 32.0,
        ),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            ItemCard()
          ],
        ),
      ),
    );
  }
}