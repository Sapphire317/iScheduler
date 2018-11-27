import 'package:flutter/material.dart';


class ProfilePage extends StatefulWidget {
  @override
  ProfilePageState createState() {
    return new ProfilePageState();
  }
}

class ProfilePageState extends State<ProfilePage> {

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
              Text('No Profiles')
          )
      ),
    );
  }

}

