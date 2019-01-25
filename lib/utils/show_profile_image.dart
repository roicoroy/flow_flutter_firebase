import "package:flutter/material.dart";
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import '../models/user.dart';
import './auth_service.dart';

@override
initState() {
  User user = Auth().getCurrentUser();
}

User curUser;

void showProfileImage(BuildContext context) {
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
