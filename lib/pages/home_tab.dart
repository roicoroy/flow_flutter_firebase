import 'package:flow_flutter_firebase/auth_service.dart';
import 'package:flow_flutter_firebase/login_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
          margin: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              const Text.rich(
                TextSpan(
                  text:
                      'Using our versatile management system, The Flow Zone, you can use the Training Manager to issue training, monitor progress, view results and keep up to date with all learning activity in your business. Not only Flow modules but all types of learning activity such as workshops, on-the-job coaching, other online modules and competences can be recorded and monitored within The Flow Zone.',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
                const Text.rich(
                TextSpan(
                  text:
                      'The Talent Manager includes career planning and appraisal functionality helping you manage career progression and succession planning.',
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
              ),
                const Text.rich(
                TextSpan(
                  text:
                      'The Reporting Suite provides access to a whole range of reports that provide visibility across your organisation.',
                  style: TextStyle(fontWeight: FontWeight.w900, color: Colors.pink),
                  
                ),
              ),
            ],
          )),
    );
  }
}
