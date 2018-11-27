import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:date_utils/date_utils.dart';

import 'homeSection.dart';
import 'schedule.dart';
import 'messages.dart';
import 'profile.dart';

class scheduleData {

  DateTime tFrom;
  DateTime tTo;

  String title;
  String location;
}




class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {

  int _currentIndex = 0 ;
  final List<Widget> _children = [
      HomeWidget(),
      schedule(),
      MessagePage(),
      ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: "Helvetica Neue",
      ),
      home: new Scaffold(

          body: _children[_currentIndex],
          bottomNavigationBar:bottomBar()
//
      ),


    );
  }

  BottomNavigationBar bottomBar(){
    return BottomNavigationBar(
      onTap: onTabTapped,
      currentIndex: _currentIndex,
      items: [
        new BottomNavigationBarItem(
          icon: Icon(Icons.home,color: Colors.black),
          title: Text(''),
          activeIcon: Icon(Icons.home,color: Colors.black),

        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today,color: Colors.black),
          title: Text(''),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.mail, color: Colors.black,),
          title: Text(''),
        ),
        new BottomNavigationBarItem(
          icon: Icon(Icons.person,color: Colors.black),
          title: Text(''),
        ),
      ],
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }



}
