import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav>
    with SingleTickerProviderStateMixin {
  Animation animation, transformationAnim;
  AnimationController animationController, a2;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );

    animation = Tween(begin: 10.0, end: 200.0).animate(
        CurvedAnimation(parent: animationController, curve: Curves.ease));
    transformationAnim = BorderRadiusTween(
            begin: BorderRadius.circular(150.0),
            end: BorderRadius.circular(0.0))
        .animate(
            CurvedAnimation(parent: animationController, curve: Curves.ease));
    animationController.forward();

    animationController.addListener(() {
      setState(() {});
      print(animation.value);
    });
  }

  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            title: Text('Business'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            title: Text('School'),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
//      body: Container(
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            FlatButton(
//              child: Text('press me'),
//              onPressed: () {},
//            ),
//            Center(
//              child: Container(
//                alignment: Alignment.bottomCenter,
//                width: animation.value,
//                height: animation.value,
//                decoration: BoxDecoration(
//                  color: Colors.white,
//                  borderRadius: transformationAnim.value,
//                ),
//              ),
//            ),
//            DefaultTabController(
//              length: 3,
//              child: Scaffold(
//                bottomNavigationBar: AppBar(
//                  leading: TabBar(
//                    tabs: [
//                      Tab(icon: Icon(Icons.directions_car)),
//                      Tab(icon: Icon(Icons.directions_transit)),
//                      Tab(icon: Icon(Icons.directions_bike)),
//                    ],
//                  ),
//                ),
//              ),
//            )
//          ],
//        ),
//      ),
    );
  }
}
