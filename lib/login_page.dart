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
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: _buildBackgroundImage(),
        ),
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Center(
                child: FloatingActionButton.extended(
                  onPressed: () => _handleSignIn(),
                  backgroundColor: Colors.black,
                  icon: Image.asset('assets/google_g_logo.png', height: 40.0),
                  label: const Text('Sign in with Google'),
                  // Always remember FAB is far sexier than normal button ;)
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.dstATop),
      image: AssetImage('assets/flow-zone.jpg'),
    );
  }
}
