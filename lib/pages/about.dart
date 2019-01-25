import 'package:flow_flutter_firebase/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../models/user.dart';
import '../auth_service.dart';

class About extends StatefulWidget {
  const About({Key key}) : super(key: key);
  @override
  _About createState() => _About();
}

class _About extends State<About> {
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
          body: Container(
            margin: EdgeInsets.symmetric(horizontal: 10.0),
            child: new ListView(
              children: <Widget>[
                new PortfolioModuleCard(
                  title: "Compliance Suite",
                  paragraphs: [
                    "This suite of modules is ideal for all staff working in licensed premises, dispensing and serving alcohol to customers as well as those working in a kitchen and responsible for food.",
                    "Staff can train at their own pace and benefit from all the interactive learning techniques.  End of section tests and end of module exams ensure that staff complete their modules with a full understanding of their responsibilities and compliance with legislation."
                  ],
                ),
                new PortfolioModuleCard(
                  title: "Compliance Compact",
                  paragraphs: [
                    "This must-have suite contains a range of short micro modules which aim to educate learners on a range of current workplace standards.",
                    "By completing these modules learners can ensure they are fully compliant and avoid the risk of incurring penalties in the workplace. This suite allows learners to cover a broad range of topics, maximising their knowledge and awareness of current legislation relevant to their role."
                  ],
                ),
                new PortfolioModuleCard(
                  title: "Service Suite",
                  paragraphs: [
                    "Whether you run a busy city centre bar, a hotel, a coffee shop or a nightclub, Flow training will equip your staff with the essential skills required to set up and efficiently run a professional business.",
                    "Staff will learn everything from weights and measures responsibilities, to essential product knowledge, drink presentation and, of course, taking care of customers."
                  ],
                ),
                new PortfolioModuleCard(
                  title: "Hotel Suite",
                  paragraphs: [
                    "In a thriving and highly competitive industry, our Hotel Suite will provide your staff with a complete training package to prepare them for working successfully within a hotel.",
                    "The Hotel Suite modules cover the fundamental areas of working in a hotel, such as reception, housekeeping, food and beverage and concierge.  The modules also focus on providing outstanding service to guests throughout the hotel."
                  ],
                ),
                new PortfolioModuleCard(
                  title: "Management Suite",
                  paragraphs: [
                    "This essential suite of modules is tailored specifically to help develop effective management and strong leadership in hospitality managers. The suite covers a range of key managerial topics, identified through extensive research and in-the-field experience. Designed to suit both those who are new to management, as well as those with more experience, the modules are comprehensive, immersive and invaluable."
                  ],
                ),
                new PortfolioModuleCard(
                  title: "Trend Suite",
                  paragraphs: [
                    "This exciting new suite contains short, quick-to-complete micro modules which aim to educate learners in relevant industry trends, allowing them to share their knowledge and passion and enhance customer experience.",
                    "Each module will focus on an individual trend such as Craft Beer, Gin, etc. and will be reviewed every 6-12 months to ensure they remain relevant and up-to-date."
                  ],
                ),
                new PortfolioModuleCard(
                  title: "Cafe Culture",
                  paragraphs: [
                    "Café Culture is an innovative suite of modules specifically designed for those who work in the booming café and coffee shop industry. The knowledge and skills your staff will gain as they work through the modules will help your business stand out from competitors, increase job satisfaction amongst staff, and ultimately impress your customers."
                  ],
                )
              ],
            ),
          ),
        ),
      );
}

class PortfolioModuleCard extends StatefulWidget {
  final String title;
  final List<String> paragraphs;

  PortfolioModuleCard({this.title = "Test Module", this.paragraphs});

  @override
  _PortfolioModuleCardState createState() => _PortfolioModuleCardState();
}

class _PortfolioModuleCardState extends State<PortfolioModuleCard> {
  bool isExpanded = false;

  List<Widget> generateCardChildren() {
    List<Widget> children = [];

    if (this.widget.paragraphs is List) {
      this.widget.paragraphs.forEach((paragraph) {
        children.add(new ListTile(
          title: new Text(
            paragraph,
            textScaleFactor: 1.1,
          ),
        ));
      });
    }

    children.add(// add bit ad-hoc end padding
        new SizedBox(
      height: 10.0,
    ));

    return children;
  }

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new ExpansionTile(
        onExpansionChanged: (bool hasExpanded) {
          this.setState(() {
            this.isExpanded = hasExpanded;
          });
        },
        title: new Text(
          this.widget.title,
          textScaleFactor: (this.isExpanded) ? 1.2 : 1.0,
        ),
        children: this.generateCardChildren(),
      ),
    );
  }
}
