import 'dart:convert';
import 'package:flow_flutter_firebase/pages/animation_demo.dart';
import 'package:flow_flutter_firebase/utils/auth_service.dart';
import 'package:flow_flutter_firebase/flow_app.dart';
import 'package:flow_flutter_firebase/login_page.dart';
import 'package:flow_flutter_firebase/pages/about.dart';
import 'package:flow_flutter_firebase/pages/support.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './models/user.dart';

void main() => runApp(LoginWidget());

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
      routes: {
        // '/': (BuiRldContext context) => MyHomePage(),
        '/about': (BuildContext context) => About(),
        '/support': (BuildContext context) => Support(),
        '/animation': (BuildContext context) => AnimationDemo(),
      },
      onUnknownRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            builder: (BuildContext context) => LoginPage());
      },
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.pink,
          accentColor: Color(0xffe9408d),
          buttonColor: Colors.deepPurple),
      home: new Container(
        decoration: new BoxDecoration(
          color: new Color(0xFF2f2e2e),
        ),
        // margin: EdgeInsetsDirectional.only(top: 25.0),
        child: _routingWidget,
      ),
    );
  }
}
