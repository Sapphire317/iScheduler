import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

class schedule extends StatefulWidget {
  @override
  scheduleState createState() {
    return new scheduleState();
  }
}

class scheduleState extends State<schedule> {

  void handleNewDate(date) {
    print("handleNewDate ${date}");
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: new Scaffold(

        body: new Container(
          margin: new EdgeInsets.symmetric(
            horizontal: 5.0,
            vertical: 10.0,
          ),
          child: new ListView(
            shrinkWrap: true,
            children: <Widget>[

              new Divider(
                height: 50.0,
              ),
              new Calendar(
                onSelectedRangeChange: (range) =>
                    print("Range is ${range.item1}, ${range.item2}"),
                isExpandable: true,

              ),
              new Divider(
                height: 50.0,
              ),


            ],
          ),
        ),
      ),
    );
  }

}

