import 'package:flow_flutter_firebase/auth_service.dart';
import 'package:flow_flutter_firebase/models/user.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Profile extends StatefulWidget {
  const Profile({Key key}) : super(key: key);
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
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
  void _showProfileImage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (ctx) => Scaffold(
            appBar: AppBar(
              title: Text('${curUser.name}'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.more_vert),
                  onPressed: () => print('pressed'),
                )
              ],
            ),
            body: Center(
              child: Hero(
                tag: curUser.id,
                child: CachedNetworkImage(
                  imageUrl: curUser.imgURL.replaceAll('s96-c', 's400-c'),
                  // Increase image size
                  placeholder: CircularProgressIndicator(),
                  errorWidget: Icon(Icons.error),
                ),
              ),
            ))));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffe9408d),
      child: GestureDetector(
        child: Center(
          child: Hero(
            tag: curUser.id,
            child: CachedNetworkImage(
              imageUrl: curUser.imgURL.replaceAll('s96-c', 's400-c'),
              // Increase image size
              placeholder: CircularProgressIndicator(),
              errorWidget: Icon(Icons.error),
            ),
          ),
        ),
        // CircleAvatar(
        //   backgroundImage: CachedNetworkImageProvider(curUser.imgURL),
        // ),
        onTap: () => _showProfileImage(context),
      ),
    );
  }
}
