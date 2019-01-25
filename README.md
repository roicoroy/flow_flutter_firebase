# Flow+Flutter+Firebase

My new project.

- Firebase added for Android
- Assets on Android Platform
- Auth Service


# To do:
 
 Routes
 Navigation system

Flow pink = #e9408d
flow background grey = #2f2e2e


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Blank Flutter App',
      home: new Text('Home Page'),
    );
  }
}



import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({ Key key }) : super(key: key);

  @override
  _About createState() => _About();
}

class _About extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Container(color: const Color(0xFFFFE306));
  }
}