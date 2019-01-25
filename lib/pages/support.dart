import 'package:flow_flutter_firebase/auth_service.dart';
import 'package:flow_flutter_firebase/login_page.dart';
import 'package:flow_flutter_firebase/pages/support.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../models/user.dart';
import '../auth_service.dart';

class Support extends StatefulWidget {
  const Support({Key key}) : super(key: key);
  @override
  _Support createState() => _Support();
}

class _Support extends State<Support> {
  @override
  initState() {
    User user = Auth().getCurrentUser();
    if (user != null) {
      setState(() {
        curUser = user;
      });
    }
    super.initState();
  }

  User curUser;

  @override
  Widget build(BuildContext context) => new WillPopScope(
        onWillPop: () {
          print('Back button pressed!');
          Navigator.pop(context, false);
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              new CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(curUser.imgURL),
              ),
            ],
          ),
        ),
      );
}

// class About extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => new WillPopScope(
//         onWillPop: () {
//           print('Back button pressed!');
//           Navigator.pop(context, false);
//           return Future.value(false);
//         },
//         child: Scaffold(
//             appBar: AppBar(),
//           ),
//   );
// }
