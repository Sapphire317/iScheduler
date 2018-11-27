import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_calendar/flutter_calendar.dart';


class ConfirmPage extends StatefulWidget {

  int eventCode; //1: Schedule, 2: Meeting

  @override
  ConfirmPageState createState() {
    return new ConfirmPageState();
  }
}

class ConfirmPageState extends State<ConfirmPage> {

  DateTime _today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: "Helvetica Neue",
      ),
      home: new Scaffold(
        body: new Container(
            padding: EdgeInsets.fromLTRB(0.0, 40.0, 0.0, 0.0),
            child: new Column(
              children: <Widget>[
                Divider(),
                HeadSection(),
                Divider(),
                new Calendar(
                  onSelectedRangeChange: (range) =>
                      print("Range is ${range.item1}, ${range.item2}"),
                ),
              ],
            )
        ),

      ),


    );
  }

  Widget HeadSection(){
      return new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

          FlatButton(onPressed: (){Navigator.pop(context);},
              child: Text('Back')),
          Text('Results',
              style:TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold
              )
          ),
          FlatButton(onPressed: (){print('OK');},
              child: Text('OK')),
        ],
      );
    }

}