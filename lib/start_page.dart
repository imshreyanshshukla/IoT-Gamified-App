import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:iothnicapp/home_page.dart';
import 'package:iothnicapp/leaderboard.dart';
import 'package:iothnicapp/menu.dart';
import 'package:iothnicapp/no_notification.dart';
import 'package:iothnicapp/notification_page.dart';
import 'package:iothnicapp/speakers_page.dart';


class StartPage extends StatefulWidget{
  const StartPage({Key? key}) : super(key:key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage>{
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    SpeakersPage(),
    NoNotificationsPage(),
    LeaderBoard(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: MenuPage(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black54,
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
              backgroundColor: Colors.transparent
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Speakers",
              backgroundColor: Colors.transparent
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
            backgroundColor: Colors.transparent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.poll),
            label: "Results",
            backgroundColor: Colors.transparent,
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        iconSize:25,
        onTap: _onItemTapped,
        elevation: 0,
      ),
    );
  }
}
