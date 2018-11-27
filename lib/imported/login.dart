import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'dart:async';

import 'googlebutton.dart';



class LoginSecondPage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        body: new Padding(
            padding: const EdgeInsets.all(20.0),
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Text(
                    'iScheduler',
                    textAlign: TextAlign.center,
                    style: new TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Roboto',
                    )
                ),
                new Padding(
                  padding: const EdgeInsets.all(30.0),
                ),
                new TextField(
                  decoration: new InputDecoration(
                    hintText: 'Username',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey[220],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(4.0),
                ),
                new TextField(
                  decoration: new InputDecoration(
                    hintText: 'Password',
                    border: InputBorder.none,
                    filled: true,
                    fillColor: Colors.grey[220],
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.all(5.0),
                ),
                new Padding(
                  padding: const EdgeInsets.all(5.0),
                ),
                new RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue,
                    onPressed: null,
                    child: new Text(
                      'Login',
                      textAlign: TextAlign.center,
                    )
                ),
                new MaterialButton(
                  child: button('Google', 'assets/google.png'),
                  onPressed: () {print("google");},
                  color: Colors.white,

                ),
                new Padding(
                  padding: const EdgeInsets.all(10.0),
                )

              ],
            )
        )
    );
  }
}