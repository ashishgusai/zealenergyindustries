import 'package:flutter/material.dart';
import 'package:zealenergyindustries/pages/Employee_page.dart';
import 'package:zealenergyindustries/pages/Profile_page.dart';
import 'utils/routes.dart';
import 'pages/Home_page.dart';
import 'pages/Login_page.dart';
import 'widgets/themes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      routes: {
        "/": (context) => HomePage(),
        MyRoutes.homeRoute: (context) => HomePage(),
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.profileRoute: (context) => ProfilePage(),
        MyRoutes.employeeRoute: (context) => EmployeePage(),
      },
    );
  }
}
