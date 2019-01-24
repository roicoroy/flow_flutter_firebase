import 'dart:convert';
import 'package:flow_flutter_firebase/auth_service.dart';
import 'package:flow_flutter_firebase/flow_app.dart';
import 'package:flow_flutter_firebase/login_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './models/user.dart';

void main() => runApp(LoginWidget());
// +++++ TODO++++
// Add routing for tab/side menu navigation





// here define user,
// load first login page then go to
// home page is logged in.


//class YellowBird extends StatefulWidget {
//  const YellowBird({ Key key }) : super(key: key);
//
//  @override
//  _YellowBirdState createState() => _YellowBirdState();
//}
//
//class _YellowBirdState extends State<YellowBird> {
//  @override
//  Widget build(BuildContext context) {
//    return Container(color: const Color(0xFFFFE306));
//  }
//}
//


class LoginWidget extends StatefulWidget {
  _LoginWidget createState() => _LoginWidget();
}

class _LoginWidget extends State<LoginWidget> {
  final String _kUserPref = "UserPref";
  Widget _routingWidget = LoginPage();

  Future<Null> getSharedPref() async {
    final SharedPreferences _localPref = await SharedPreferences.getInstance();
    String userProfile = _localPref.getString(_kUserPref);
    if (userProfile != null) {
      Auth().setCurrentUser(User.fromMap(json.decode(userProfile)));
      setState(() {
        _routingWidget = FlowApp();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getSharedPref();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.deepOrange,
          accentColor: Colors.deepPurple,
          buttonColor: Colors.deepPurple),
      home: Container(
        child: _routingWidget,
      ),
    );
  }
}

