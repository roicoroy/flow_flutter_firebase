
import 'package:flow_flutter_firebase/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flow_flutter_firebase/flow_app.dart';

class LoginPage extends StatefulWidget {
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  initState() {
    super.initState();
  }

  Future<void> _handleSignIn() async {
    FirebaseUser user = await Auth().signIn();
    if (user != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return FlowApp();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: FloatingActionButton.extended(
      onPressed: () => _handleSignIn(),
      backgroundColor: Colors.white,
      icon: Image.asset('assets/google_g_logo.png', height: 40.0),
      label: const Text('Sign in with Google'),
      // Always remember FAB is far sexier than normal button ;)
    ));
  }
}



