import 'package:flow_flutter_firebase/auth_service.dart';
import 'package:flow_flutter_firebase/login_page.dart';
import 'package:flow_flutter_firebase/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
// import './utils/show_profile_image.dart';

import './pages/home_tab.dart' as _firstTab;
import './pages/chat_tab.dart' as _secondTab;
import './pages/profile_tab.dart' as _thirdTab;
import 'package:cached_network_image/cached_network_image.dart';



class FlowApp extends StatefulWidget {
  @override
  TabsState createState() => new TabsState();
}

class TabsState extends State<FlowApp> {
  PageController _tabController;

  var _title_app = null;
  int _tab = 0;

  @override
  void initState() {
    _tabController = new PageController();
    this._title_app = TabItems[0].title;

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
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) => new Scaffold(
        backgroundColor: Color(0xffe9408d),
        appBar: new AppBar(
          actions: <Widget>[
            new CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(curUser.imgURL),
            ),
          ],
          title: new Text(
            _title_app,
            style: new TextStyle(
              fontSize: Theme.of(context).platform == TargetPlatform.iOS
                  ? 17.0
                  : 20.0,
            ),
          ),
          elevation:
              Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        ),
        //Drawer
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new Container(
                color: new Color(0xFF2f2e2e),
                height: 120.0,
                child: new DrawerHeader(
                  padding: new EdgeInsets.all(0.0),
                  // decoration: new BoxDecoration(
                  //   color: new Color(0xFF2f2e2e),
                  // ),
                  child: new Center(child: new Image.asset('assets/logo.png')),
                ),
              ),
              new Container(
                color: new Color(0xFFe9408d),
                child: Column(
                  children: <Widget>[
                    new ListTile(
                        leading: new Icon(Icons.chat),
                        title: new Text('Support'),
                        onTap: () {
                          Navigator.pop(context);
                          Navigator.of(context).pushNamed('/support');
                        }),
                    new ListTile(
                      leading: new Icon(Icons.info),
                      title: new Text('About'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.of(context).pushNamed('/about');
                      },
                    ),
                    new Divider(),
                    new ListTile(
                      leading: new Icon(Icons.exit_to_app),
                      title: new Text('Sign Out'),
                      onTap: () {
                        Auth().signOut();
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        //Content of tabs
        body: new PageView(
          controller: _tabController,
          onPageChanged: onTabChanged,
          children: <Widget>[
            new _firstTab.MyHomePage(),
            new _secondTab.Chat(),
            new _thirdTab.Profile()
          ],
        ),

        //Tabs
        bottomNavigationBar: Theme.of(context).platform == TargetPlatform.iOS
            ? new CupertinoTabBar(
                activeColor: Colors.blueGrey,
                currentIndex: _tab,
                onTap: onTap,
                items: TabItems.map((TabItem) {
                  return new BottomNavigationBarItem(
                    title: new Text(TabItem.title),
                    icon: new Icon(TabItem.icon),
                  );
                }).toList(),
              )
            : new BottomNavigationBar(
                currentIndex: _tab,
                onTap: onTap,
                items: TabItems.map((TabItem) {
                  return new BottomNavigationBarItem(
                    title: new Text(TabItem.title),
                    icon: new Icon(TabItem.icon),
                  );
                }).toList(),
              ),
      );

  void onTap(int tab) {
    _tabController.jumpToPage(tab);
  }

  void onTabChanged(int tab) {
    setState(() {
      this._tab = tab;
    });

    switch (tab) {
      case 0:
        this._title_app = TabItems[0].title;
        break;

      case 1:
        this._title_app = TabItems[1].title;
        break;

      case 2:
        this._title_app = TabItems[2].title;
        break;
    }
  }
}

class TabItem {
  const TabItem({this.title, this.icon});
  final String title;
  final IconData icon;
}

const List<TabItem> TabItems = const <TabItem>[
  const TabItem(title: 'Home', icon: Icons.home),
  const TabItem(title: 'Chat', icon: Icons.chat_bubble),
  const TabItem(title: 'Profile', icon: Icons.settings)
];
