import 'package:flutter/material.dart';

import './pages/homepage.dart';

class TabbedAppBarSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.teal
      ),
      home: HomePage()
    );
  }
}

void main() {
  runApp(TabbedAppBarSample());
}
