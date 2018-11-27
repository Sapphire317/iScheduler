import 'package:flutter/material.dart';
import 'package:flutter_calendar/flutter_calendar.dart';

class MessagePage extends StatefulWidget {
  @override
  MessagePageState createState() {
    return new MessagePageState();
  }
}

class MessagePageState extends State<MessagePage> {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: new Scaffold(

        body: new Center(
          child:
            Text('No Messages')
        )
      ),
    );
  }

}

