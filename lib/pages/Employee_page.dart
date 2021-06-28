import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:zealenergyindustries/utils/anime_search_bar.dart';

class EmployeePage extends StatefulWidget {
  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  TextEditingController searchcontoller = new TextEditingController();
  double searchtop = 50;
  double searchleft = 10;
  final imageUrl =
      "https://st2.depositphotos.com/1104517/11965/v/600/depositphotos_119659092-stock-illustration-male-avatar-profile-picture-vector.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          ListView(
            //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 28),
            children: [
              Slidable(
                actionPane: SlidableDrawerActionPane(),
                actionExtentRatio: 0.25,
                child: Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(25, 10, 0, 0),
                          child: Text(
                            "Username",
                            style: TextStyle(
                                color: Colors.deepPurple,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Divider(
                          thickness: 1,
                          color: Colors.deepPurple,
                          indent: 26,
                          endIndent: 20,
                        ),
                        ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.indigoAccent,
                            child: Image(image: NetworkImage(imageUrl)),
                            foregroundColor: Colors.white,
                          ),
                          title: Text('Full Name'),
                          subtitle: Text('Email Id'),
                        ),
                      ],
                    )),
                actions: <Widget>[
                  IconSlideAction(
                      caption: 'Edit',
                      color: Colors.blue,
                      icon: Icons.edit,
                      onTap: () {} //_showSnackBar('Archive'),
                      ),
                  IconSlideAction(
                      caption: 'Delete',
                      color: Colors.indigo,
                      icon: Icons.delete,
                      onTap: () {} //_showSnackBar('Archive'),
                      ),
                ],
                secondaryActions: <Widget>[
                  IconSlideAction(
                      caption: 'Reset',
                      color: Colors.black45,
                      icon: Icons.reset_tv,
                      onTap: () {} //_showSnackBar('Archive'),
                      ),
                  IconSlideAction(
                      caption: 'Permission',
                      color: Colors.red,
                      icon: Icons.admin_panel_settings,
                      onTap: () {} //_showSnackBar('Archive'),
                      ),
                ],
              ),
            ],
          ),
          // Padding(
          //   padding: const EdgeInsets.only(top: 50.0, right: 10, left: 10),

          /// In AnimSearchBar widget, the width, textController, onSuffixTap are required properties.
          /// You have also control over the suffixIcon, prefixIcon, helpText and animationDurationInMilli
          GestureDetector(
            child: Padding(
              padding:
                  EdgeInsets.only(top: searchtop, right: 10, left: searchleft),
              child: AnimSearchBar(
                prefixIcon: Icon(Icons.search, color: Colors.deepPurple),
                suffixIcon: Icon(Icons.clear, color: Colors.deepPurple),
                rtl: false,
                width: 400,
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
                textController: searchcontoller,
                onSuffixTap: () {
                  setState(() {
                    searchcontoller.clear();
                  });
                },
              ),
            ),
            onVerticalDragUpdate: (DragUpdateDetails dd) {
              setState(() {
                searchtop = dd.localPosition.dy;
                searchleft = dd.localPosition.dx;
              });
            },
          ),
        ],
      ),
    );
  }
}
