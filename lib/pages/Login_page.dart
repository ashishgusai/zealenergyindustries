import 'package:flutter/material.dart';
import 'package:zealenergyindustries/controller/controller.dart';
import '/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController loginUsername = TextEditingController();

  TextEditingController passwordUsername = TextEditingController();
  String? name = "";
  bool chngbut = false;
  final formkey = GlobalKey<FormState>();
  String checkUsernames() {
    var result = loginUser(loginUsername.text, passwordUsername.text);
    print("vatsal shah" + result.toString());
    return result.toString();
    //dynamic data apid check here
  }

  moveToHome(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      setState(() {
        chngbut = true;
      });
      print("${loginUsername.text} has password ${passwordUsername.text}");
      if (checkUsernames() == "true") {
        await Future.delayed(Duration(milliseconds: 600));
        await Navigator.pushNamed(context, MyRoutes.homeRoute);
        setState(() {
          chngbut = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: formkey,
            child: Column(
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
                            hintText: "Enter Username", labelText: "Username"),
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
                            hintText: "Enter Password", labelText: "Password"),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(chngbut ? 150 : 8),
                  child: InkWell(
                    onTap: () async => moveToHome(context),
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      height: 50,
                      width: chngbut ? 60 : 120,
                      alignment: Alignment.center,
                      child: chngbut
                          ? Icon(Icons.done, color: Colors.white)
                          : RichText(
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
        ));
  }
}
