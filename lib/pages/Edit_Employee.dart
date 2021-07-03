import 'package:flutter/material.dart';

class EmployeeEditPage extends StatefulWidget {
  @override
  _EmployeeEditPageState createState() => _EmployeeEditPageState();
}

class _EmployeeEditPageState extends State<EmployeeEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Employee"),
        centerTitle: true,
      ),
    );
  }
}
