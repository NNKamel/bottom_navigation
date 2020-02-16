import 'package:flutter/material.dart';

import 'bottom_nav_ex.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  void initState() {}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo', theme: ThemeData.dark(), home: BottomNav());
  }
}
