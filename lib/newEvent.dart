import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:flutter/cupertino.dart';

import 'confirm.dart';





class NewEventPage extends StatefulWidget {

  int eventCode; //1: Schedule, 2: Meeting

  NewEventPage({@required this.eventCode});
  @override
  NewEventPageState createState() {
    return new NewEventPageState();
  }
}

class NewEventPageState extends State<NewEventPage> {

  final List<String> weekday = [
  "MON",
  "TUE",
  "WED",
  "THU",
  "FRI",
  "SAT",
  "SUN",
];

  final List<String> monthName = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec",
  ];

  bool _value1 = false;
  void _onChanged1(bool value) => setState(() => _value1 = value);

  TextEditingController titleCtlr_S = new TextEditingController();
  TextEditingController locationCtlr_S_ = new TextEditingController();
  TextEditingController titleCtlr_M = new TextEditingController();
  TextEditingController locationCtlr_M = new TextEditingController();

  NumberPicker hourPicker;
  NumberPicker inviteePicker;
  int _currentHour = 1;
  int _currentInvitee = 0;

  DateTime meetingStartDT = DateTime.now();
  DateTime meetingEndDT = DateTime.now();
  DateTime scheduleStartDT = DateTime.now();
  DateTime scheduleEndDT = DateTime.now();


  _handleValueChanged(num value) {
    if (value != null) {
      if (value is int) {
        setState(() => _currentHour = value);
      }
    }
  }

  _handleValueChangedExternally_t(num value) {
    if (value != null) {
      if (value is int) {
        setState(() => _currentHour = value);
        hourPicker.animateInt(value);
      }
    }
  }

  _handleValueChangedExternally_i(num value) {
    if (value != null) {
      if (value is int) {
        setState(() => _currentInvitee = value);
        hourPicker.animateInt(value);
      }
    }
  }
  @override
  Widget build(BuildContext context) {

    hourPicker = new NumberPicker.integer(
        initialValue: _currentHour,
        minValue: 1,
        maxValue: 24,
        onChanged: _handleValueChanged);

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
              SizedBox(height:30.0,child:
                  Container(
                    decoration: new BoxDecoration(
                      color: Colors.grey,
                    ),
                  )
              ),
              TitleSection(),
              Divider(),
              SizedBox(height:30.0,child:
              Container(
                decoration: new BoxDecoration(
                  color: Colors.grey,
                ),
              )
              ),
              Divider(),
              DateSectionBuild(),
              Divider(),

            ],
          )
        ),

      ),


    );


  }

  Widget DateSectionBuild(){
    if(widget.eventCode ==1) return DateSection_Schedule();
    else if(widget.eventCode ==2) return DateSection_Meeting();
  }

  Future _showTimeDialog() async {
    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return new NumberPickerDialog.integer(
          minValue: 1,
          maxValue: 24,
          step: 1,
          initialIntegerValue: _currentHour,
        );
      },
    ).then(_handleValueChangedExternally_t);
  }

  Future _showInviteDialog() async {
    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return new NumberPickerDialog.integer(
          minValue: 0,
          maxValue: 10,
          step: 1,
          initialIntegerValue: _currentInvitee,
        );
      },
    ).then(_handleValueChangedExternally_i);
  }



  //EventCode = 1: Schedule, 2 : Meeting,
  //startOrEnd = 1: Start, 2: End
  Future _showDateTimeDiaog(int eventCode, int startOrEnd) async {
    await showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) {
          return _buildBottomPicker(
            CupertinoDatePicker(
              mode: CupertinoDatePickerMode.dateAndTime,
              initialDateTime: DateTime.now(),
              onDateTimeChanged: (DateTime newDateTime) {
                switch(eventCode){
                  case 1:
                    if(startOrEnd==1)
                      setState(() {
                      scheduleStartDT = newDateTime;
                    });else
                      setState(() {
                        scheduleEndDT = newDateTime;
                      });
                    break;
                  case 2:
                    if(startOrEnd==1)
                      setState(() {
                        meetingStartDT = newDateTime;
                      });else
                      setState(() {
                        meetingEndDT = newDateTime;
                      });
                    break;
                }
              },
            ),
          );
        }
    );
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: 216.0,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }



  Widget HeadSection(){
    if(widget.eventCode == 1){
      return new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

          FlatButton(onPressed: (){Navigator.pop(context);},
              child: Text('Back')),
          Text('New Schedule',
              style:TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold
              )
          ),
          FlatButton(onPressed: (){print('OK');},
              child: Text('OK')),
        ],
      );
    }else if(widget.eventCode ==2){
      return new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[

          FlatButton(onPressed: (){Navigator.pop(context);},
              child: Text('Back')),
          Text('New Meeting',
              style:TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold
              )
          ),
          FlatButton(
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ConfirmPage()));
              },
              child: Text('OK')),
        ],
      );
    }

  }



  Widget TitleSection(){
    return new Column(

      children: <Widget>[
        Divider(),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            new Padding(
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 5.0,5.0),
                child: new SizedBox(
                  width: 200,
                  child: new TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Title',
                      contentPadding: EdgeInsets.all(1.0),
                    ),
                  )
                )
            ),


          ],
        ),
        Divider(),
        new Row(
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 5.0,5.0),
                child: new SizedBox(
                    width: 200,
                    child: new TextField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(1.0),
                          border: InputBorder.none,
                          hintText: 'Location'
                      ),
                    )
                )
            ),

          ],
        ),
      ],
    );
  }

  Widget DateSection_Schedule(){
    return new Column(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0,5.0),
                child: Text('All-day',
                    style: TextStyle(
                        fontSize: 15.0,

                    ))
            ),
            new Switch(value: _value1, onChanged: _onChanged1,),
          ],
        ),
        Divider(),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 5.0,5.0),
                child: Text('Starts',
                    style: TextStyle(
                        fontSize: 15.0,

                    ))
            ),
            new FlatButton(
                onPressed:(){_showDateTimeDiaog(widget.eventCode, 1);},
                child: Text(
                        weekday[scheduleStartDT.weekday-1]+" "+
                        scheduleStartDT.day.toString()+" "+
                        monthName[scheduleStartDT.month-1]+"    "+
                        scheduleStartDT.hour.toString()+" : "+
                        scheduleStartDT.minute.toString()
                )
            ),
          ],
        ),
        Divider(),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 5.0,5.0),
                child: Text('Ends',
                    style: TextStyle(
                        fontSize: 15.0,

                    ))
            ),
            new FlatButton(
                onPressed:(){_showDateTimeDiaog(widget.eventCode, 2);},
                child: Text(
                    weekday[scheduleEndDT.weekday-1]+" "+
                        scheduleEndDT.day.toString()+" "+
                        monthName[scheduleEndDT.month-1]+"     "+
                        scheduleEndDT.hour.toString()+" : "+
                        scheduleEndDT.minute.toString()
                )
            ),
          ],
        ),
      ],
    );
  }

  Widget DateSection_Meeting(){
    return new Column(
      children: <Widget>[
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0,5.0),
                child: Text('Meeting Time',
                    style: TextStyle(
                      fontSize: 15.0,

                    ))
            ),
            new FlatButton(
                onPressed:() => _showTimeDialog(),
                child: Text(_currentHour.toString() + " hours")
            ),
          ],
        ),
        Divider(),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 5.0,5.0),
                child: Text('Starts',
                    style: TextStyle(
                      fontSize: 15.0,

                    ))
            ),
            new FlatButton(
                onPressed:(){_showDateTimeDiaog(widget.eventCode, 1);},
                child: Text(
                    weekday[meetingStartDT.weekday-1]+" "+
                    meetingStartDT.day.toString()+" "+
                        monthName[meetingStartDT.month-1]+" "+
                        meetingStartDT.hour.toString()+" "+
                        meetingStartDT.minute.toString()
                )
            ),
          ],
        ),
        Divider(),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 5.0,5.0),
                child: Text('Ends',
                    style: TextStyle(
                      fontSize: 15.0,

                    ))
            ),
            new FlatButton(
                onPressed:(){_showDateTimeDiaog(widget.eventCode, 2);},
                child: Text(
                    weekday[meetingEndDT.weekday-1]+" "+
                        meetingEndDT.day.toString()+" "+
                        monthName[meetingEndDT.month-1]+" "+
                        meetingEndDT.hour.toString()+" "+
                        meetingEndDT.minute.toString()
                )
            ),
          ],
        ),
        Divider(),
        new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Padding(
                padding: EdgeInsets.fromLTRB(20.0, 5.0, 5.0,5.0),
                child: Text('Invitees',
                    style: TextStyle(
                      fontSize: 15.0,
                    ))
            ),
            new FlatButton(
                onPressed:() => _showInviteDialog(),
                child: Text(_currentInvitee.toString())),
          ],
        ),
      ],
    );
  }
}
