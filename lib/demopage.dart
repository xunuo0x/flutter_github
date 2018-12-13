import 'package:flutter/material.dart';
import './demoitem.dart';

class DemoPage extends StatefulWidget {
  @override
  _DemoPageState createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
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
        child: ListView.builder(
          itemBuilder: (context, index){
            return new ItemCard();
          },
          itemCount: 20,
        )
      ),
    );
  }
}