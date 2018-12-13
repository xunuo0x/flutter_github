import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {

  _getBottomItem(IconData icon, String text) {
    return new Expanded(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
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
              child: Text(
                'title', 
                style: TextStyle(color: Colors.blueAccent, fontSize: 20.0),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
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
