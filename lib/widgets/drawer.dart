import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zealenergyindustries/utils/routes.dart';

class MyDrawer extends StatelessWidget {
  final imageUrl =
      "https://st2.depositphotos.com/1104517/11965/v/600/depositphotos_119659092-stock-illustration-male-avatar-profile-picture-vector.jpg";
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.profileRoute);
              },

              // padding: EdgeInsets.zero,
              // decoration: BoxDecoration(
              //   color: Colors.deepPurple,
              // ),

              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.zero,
                // decoration: BoxDecoration(
                //   color: Colors.deepPurple,
                // ),
                accountName: Text("Vatsal"),
                accountEmail: Text("Vatsal407@gmail.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.homeRoute);
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.home,
                ),
                title: Text(
                  "Home",
                  textScaleFactor: 1.5,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.employeeRoute);
              },
              child: ListTile(
                leading: Icon(
                  Icons.assignment_ind_outlined,
                ),
                title: Text(
                  "Employee",
                  textScaleFactor: 1.5,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, MyRoutes.client);
              },
              child: ListTile(
                leading: Icon(
                  CupertinoIcons.profile_circled,
                ),
                title: Text(
                  "Clients",
                  textScaleFactor: 1.5,
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.bolt_horizontal,
              ),
              title: Text(
                "About Us",
                textScaleFactor: 1.5,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.arrow_right_circle,
              ),
              title: Text(
                "Log Out",
                textScaleFactor: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
