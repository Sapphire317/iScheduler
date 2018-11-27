import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_calendar/flutter_calendar.dart';
import 'package:date_utils/date_utils.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

import 'newEvent.dart';

class HomeWidget extends StatefulWidget {

  @override
  HomeWidgetState createState() => HomeWidgetState();
}

class HomeWidgetState extends State<HomeWidget>{

  bool _dialVisible  = true;

  @override
  Widget build(BuildContext context) {

    return new Stack(
      children: <Widget>[
        Scaffold(
        body:
          new Container(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              greetingSection(),
              selectDate(),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  scheduleCard()
                ],
              )
            ],
           )
         ),
    floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.event_add,
        animatedIconTheme: IconThemeData(size: 22.0),
        // this is ignored if animatedIcon is non null
        // child: Icon(Icons.add),
        visible: _dialVisible,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Color.fromRGBO(120, 145, 207, 1),
        foregroundColor: Colors.white,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
        SpeedDialChild(
        child: Icon(Icons.calendar_today, color:Colors.black),
        backgroundColor: Colors.white,
        label: 'New Schedule',
        labelStyle: TextStyle(
          fontSize: 15.0,
          fontWeight: FontWeight.w300,
          color: Colors.white
          ),
        labelBackgroundColor: Colors.transparent,

        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewEventPage(eventCode:1),
            ),
          );
        }
        ),
        SpeedDialChild(
        child: Icon(Icons.people, color:Colors.black),
        backgroundColor: Colors.white,
          label: 'New Meeting',
          labelBackgroundColor: Colors.transparent,
          labelStyle: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w300,
              color: Colors.white
          ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewEventPage(eventCode: 2)),
          );
        },
        ),

        ],
        ),
    ),

      ],
    );



  }

  String today(int weekday) {
    switch (weekday) {
      case 1:
        return "Monday";
        break;
      case 2:
        return "Tuesday";
        break;
      case 3:
        return "Wednesday";
        break;
      case 4:
        return "Thursay";
        break;
      case 5:
        return "Friday";
        break;
      case 6:
        return "Saturday";
        break;
      case 7:
        return "Sunday";
        break;
    }
  }

  DateTime _currentDateTime = DateTime.now();

  void previousMonth() {
    setState(() {
      _currentDateTime = Utils.previousMonth(_currentDateTime);
      var firstDateOfNewMonth = Utils.firstDayOfMonth(_currentDateTime);
      var lastDateOfNewMonth = Utils.lastDayOfMonth(_currentDateTime);
    });
  }

  void nextMonth() {
    setState(() {
      _currentDateTime = Utils.nextMonth(_currentDateTime);
      var firstDateOfNewMonth = Utils.firstDayOfMonth(_currentDateTime);
      var lastDateOfNewMonth = Utils.lastDayOfMonth(_currentDateTime);
    });
  }

  void previousDay() {
    setState(() {
      _currentDateTime = Utils.previousDay(_currentDateTime);
    });

    print(_currentDateTime);
  }

  void nextDay() {
    setState(() {
      _currentDateTime = Utils.nextDay(_currentDateTime);
    });

    print(_currentDateTime);
  }








  Widget scheduleCard(){

    return new Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child:
      SizedBox(
        width:380.0,
        height: 100.0,
        child:  new Padding(
            padding: EdgeInsets.fromLTRB(15.0,15.0,15.0,15.0),
            child:new Row(

              children: <Widget>[
                new Container(
                  child:
                  new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('9:00AM',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300
                          )
                      ),
                      Text('10:00AM',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300
                          ))
                    ],
                  ),
                ),
                VerticalDivider(color: Colors.black, width: 20.0,),
                new Container(
                  padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0.0),
                  child:new Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text('Do Something',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300
                          )
                      ),
                      Text('Incheon City Hall',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.w300
                          )
                      )
                    ],
                  ),
                )

              ],
            )
        ),
      ),
    );
  }

  Widget selectDate(){
    return new Container(
      padding: EdgeInsets.all(10.0),
      child:
      new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new IconButton(
              onPressed: previousDay,
              icon: Icon(Icons.arrow_back_ios)),
          new Text(_currentDateTime.year.toString() +" "+_currentDateTime.month.toString()+" "+_currentDateTime.day.toString()+" "+today(_currentDateTime.weekday),
              style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w300
              )),
          new IconButton(onPressed: nextDay,
              icon: Icon(Icons.arrow_forward_ios)),
        ],
      ),
    );
  }

  Widget greetingSection(){
    return
      new Container(
          padding: EdgeInsets.fromLTRB(30.0, 120.0, 30.0, 30.0),
          child:new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                  "Good Day, Danny!",
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.w300
                  )
              ),
            ],
          )
      );

  }
}


