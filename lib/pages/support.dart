import 'package:flow_flutter_firebase/utils/auth_service.dart';
import 'package:flow_flutter_firebase/login_page.dart';
import 'package:flow_flutter_firebase/pages/home_tab.dart';
import 'package:flow_flutter_firebase/pages/support.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import '../models/user.dart';
import '../utils/auth_service.dart';

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

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _companyNameController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _suggestionController = new TextEditingController();

  void clearField(String fieldName) {
    if(fieldName == "name"){
      this._nameController.clear();
    }
    else if(fieldName == "companyName"){
      this._companyNameController.clear();
    }
    else if(fieldName == "email"){
      this._emailController.clear();
    }
  }

  Widget bottomSheetBuilder(BuildContext bottomSheetContext) {

    return new Card(
      child: new Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          new ListTile(
            trailing: new IconButton(
              icon: new Icon(Icons.close),
              onPressed: (){
                Navigator.of(context).pop(); // close the BottomSheet
              }
            ),
            title: new Text("Result:", textScaleFactor: 1.2,),
          ),
          new ListTile(
            title: new Text("Name"),
            subtitle: new Text(this._nameController.text),
          ),
          new ListTile(
            title: new Text("Company Name"),
            subtitle: new Text(this._companyNameController.text),
          ),
          new ListTile(
            title: new Text("Email Name"),
            subtitle: new Text(this._emailController.text),
          ),
          new ListTile(
            title: new Text("Suggestion"),
            subtitle: new Text(this._suggestionController.text),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Suggestions"),
      ),
      body: new Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: new ListView(
          children: <Widget>[
            new ListTile(
              title: new Text("We take your suggestions to heart and use it to improve the 'flow'. If you have anything you'd like to suggest, please fill out the form below.", textScaleFactor: 1.1,),
            ),
            new Form(
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Name",
                      hintText: "Your name, e.g. John",
                      suffixIcon: new IconButton(icon: new Icon(Icons.clear), onPressed: () => this.clearField("name"))
                    ),
                    validator: (String val) {
                      if(val.isEmpty){
                        return "Name cannot be empty";
                      }
                    },
                    autovalidate: true,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    controller: this._nameController,
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Company Name",
                      hintText: "The company you work for / represent",
                      suffixIcon: new IconButton(icon: new Icon(Icons.clear), onPressed: () => this.clearField("companyName"))
                    ),
                    validator: (String val) {
                      if(val.isEmpty){
                        return "Name cannot be empty";
                      }
                    },
                    autovalidate: true,
                    keyboardType: TextInputType.text,
                    textCapitalization: TextCapitalization.words,
                    controller: this._companyNameController,
                  ),
                  new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Company Email",
                      hintText: "e.g. john@company.com",
                      suffixIcon: new IconButton(icon: new Icon(Icons.clear), onPressed: () => this.clearField("email"))
                    ),
                    validator: (String val) {
                      if(val.isEmpty){
                        return "Name cannot be empty";
                      }
                    },
                    autovalidate: true,
                    keyboardType: TextInputType.emailAddress,
                    controller: this._emailController,
                  ),
                  new Container(
                    margin: EdgeInsets.symmetric(vertical: 10.0),
                    child: new TextFormField(
                      decoration: new InputDecoration(
                        labelText: "Suggestion",
                        hintText: "Add your suggestion here",
                        border: new OutlineInputBorder()
                      ),
                      validator: (String val) {
                        if(val.isEmpty){
                          return "Name cannot be empty";
                        }
                      },
                      autovalidate: true,
                      controller: this._suggestionController,
                      textCapitalization: TextCapitalization.sentences,
                      maxLines: 3,
                    ),
                  ),
                  new Builder(
                    builder: (BuildContext scaffoldContext) { // generate a BuildContext which is within the Scaffold BuildContext
                      return new RaisedButton(
                        child: new Text("Submit"),
                        onPressed: (
                          this._nameController.text.isNotEmpty &&
                          this._companyNameController.text.isNotEmpty &&
                          this._emailController.text.isNotEmpty &&
                          this._suggestionController.text.isNotEmpty
                        )? () => Scaffold.of(scaffoldContext).showBottomSheet(this.bottomSheetBuilder) : null,
                      );
                    }
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
