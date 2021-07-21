import 'dart:ui';
import 'dart:convert';
import 'dart:io';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

import 'package:zealenergyindustries/controller/controller.dart';
import 'package:zealenergyindustries/models/employee_model.dart';
import 'package:zealenergyindustries/utils/Employee_pageutility.dart';
import 'package:zealenergyindustries/utils/anime_search_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zealenergyindustries/utils/routes.dart';

class EmployeePage extends StatefulWidget {
  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  TextEditingController searchcontoller = new TextEditingController();
  List<Data>? fetchingEmployee;
  @override
  void initState() {
    // _con.listenForStatistics();
    super.initState();
    listenForEmployee();
  }

  bool isLoading = true;
  void listenForEmployee() async {
    setState(() {
      isLoading = true;
    });
    Map map = new Map();
    final prefs = await SharedPreferences.getInstance();
    //var xtoken = prefs.getString("token");
    String xToken = "";
    if (prefs.containsKey("token") && prefs.getString("token") != null) {
      xToken = prefs.getString("token")!;
    }
    final String url = gloabalUrl + employeeDetails;

    final client = new http.Client();
    final response = await client.post(
      Uri.parse(url),
      headers: {'xtoken': xToken},
    );
    print("URl " + url);
    print("Param " + json.encode(map));
    print("Res " + json.decode(response.body).toString());

    // print("resUp " + response.body);
    if (json.decode(response.body)['status']) {
      fetchingEmployee =
          (json.decode(json.encode(json.decode(response.body)['data'])) as List)
              .map((i) => Data.fromJson(i))
              .toList();
    }
    print("vatsal");
    print(fetchingEmployee);
    setState(() {
      isLoading = false;
    });
  }

  final imageUrl =
      "https://st2.depositphotos.com/1104517/11965/v/600/depositphotos_119659092-stock-illustration-male-avatar-profile-picture-vector.jpg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee"),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 0, right: 10, left: 20),
            child: AnimSearchBar(
              prefixIcon: Icon(Icons.search, color: Colors.deepPurple),
              suffixIcon: Icon(Icons.clear, color: Colors.deepPurple),
              rtl: true,
              width: 330,
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
        ],
      ),
      body: isLoading
          ? Center(
              //height: 50,
              child: CircularProgressIndicator(),
              //color: Colors.white,
            )
          : Stack(
              children: [
                ListView.builder(
                  itemCount: fetchingEmployee!.length,
                  itemBuilder: (context, index) {
                    //final item = fetchingEmployee![index];

                    return Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.employeeRouteEdit);
                            },
                            child: Container(
                                color: Colors.white,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.fromLTRB(25, 10, 0, 0),
                                      child: Text(
                                        fetchingEmployee![index].username!,
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
                                        child: Image(
                                            image: NetworkImage(imageUrl)),
                                        foregroundColor: Colors.white,
                                      ),
                                      title: Text(fetchingEmployee![index]
                                              .firstName! +
                                          fetchingEmployee![index].lastName!),
                                      subtitle:
                                          Text(fetchingEmployee![index].email!),
                                    ),
                                  ],
                                )),
                          ),
                          actions: <Widget>[
                            IconSlideAction(
                                caption: 'Delete',
                                color: Colors.indigo,
                                icon: Icons.delete,
                                onTap: () {
                                  showDialog<String>(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                      title: const Text('Delete Employee'),
                                      content: const Text('Are You Sure?'),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'Cancel'),
                                          child: const Text('No'),
                                        ),
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, 'OK'),
                                          child: const Text('Yes'),
                                        ),
                                      ],
                                    ),
                                  );
                                } //_showSnackBar('Archive'),
                                ),
                            IconSlideAction(
                                caption: 'Reset',
                                color: Colors.black45,
                                icon: Icons.reset_tv,
                                onTap: () {
                                  displayTextInputDialog(context);
                                  // Navigator.pushNamed(
                                  //     context, MyRoutes.employeeRouteReset);
                                } //_showSnackBar('Archive'),
                                ),
                            IconSlideAction(
                                caption: 'Permission',
                                color: Colors.red,
                                icon: Icons.admin_panel_settings,
                                onTap: () {
                                  displayCheckBoxDialog(context);
                                }),
                          ],
                        ),
                      ],
                    );
                  },
                  //padding: EdgeInsets.symmetric(horizontal: 20, vertical: 28),
                ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 50.0, right: 10, left: 10),

                /// In AnimSearchBar widget, the width, textController, onSuffixTap are required properties.
                /// You have also control over the suffixIcon, prefixIcon, helpText and animationDurationInMilli
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.employeeRouteEdit);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
