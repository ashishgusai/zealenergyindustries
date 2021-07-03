import 'package:flutter/material.dart';

class EmployeePermission extends StatefulWidget {
  @override
  _EmployeePermissionState createState() => _EmployeePermissionState();
}

class _EmployeePermissionState extends State<EmployeePermission> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Permission"),
        centerTitle: true,
      ),
    );
  }
}
