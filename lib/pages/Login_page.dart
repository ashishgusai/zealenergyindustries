import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:zealenergyindustries/controller/controller.dart';
import '/utils/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginUsername = TextEditingController();

  TextEditingController passwordUsername = TextEditingController();
  String? name = "";
  final formkey = GlobalKey<FormState>();

  Future<bool> checkUsernames() async {
    Map<String, String> param = new Map<String, String>();
    param['email'] = loginUsername.text.trim().toString();
    param['password'] = passwordUsername.text.trim().toString();
    //print(json.encode(json.decode(json.encode(param))));
    var response = await postApiCall(userLogin, param);
    print(response);

    print(response["message"]);
    print(response["status"].toString());
    if (response["status"]) {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("token", response["data"]["xtoken"]);
      prefs.setBool("isLogin", true);
      prefs.setString("email", loginUsername.text);
      prefs.setString("fname", response["data"]["first_name"]);
      prefs.setString("lname", response["data"]["last_name"]);
      prefs.setString("id", response["data"]["ID"].toString());
    }
    Loader.hide();
    return response["status"];
  }

  moveToHome(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      Loader.show(context, progressIndicator: CircularProgressIndicator());
      print("${loginUsername.text} has password ${passwordUsername.text}");
      if (await checkUsernames()) {
        await Future.delayed(Duration(milliseconds: 200));
        await Navigator.pushNamed(context, MyRoutes.homeRoute);

        return true;
      }
    }
    return false;
  }

  void dispose() {
    Loader.hide();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: formkey,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Image.asset(
                    "assets/login.png",
                    fit: BoxFit.cover,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Welcome! ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "$name",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          onChanged: (value) => {
                            setState(() {
                              name = value;
                            })
                          },
                          controller: loginUsername,
                          decoration: InputDecoration(
                              hintText: "Enter Username",
                              labelText: "Username"),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Username cant be Empty";
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Password cant be Empty";
                            }
                            return null;
                          },
                          controller: passwordUsername,
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Enter Password",
                              labelText: "Password"),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () async => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 500),
                        height: 50,
                        width: 120,
                        alignment: Alignment.center,
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Login",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              WidgetSpan(
                                child: Icon(
                                  Icons.arrow_right,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                alignment: PlaceholderAlignment.middle,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
