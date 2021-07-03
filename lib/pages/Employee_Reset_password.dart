import 'package:flutter/material.dart';

class ResetPasswordEmployee extends StatefulWidget {
  @override
  _ResetPasswordEmployeeState createState() => _ResetPasswordEmployeeState();
}

class _ResetPasswordEmployeeState extends State<ResetPasswordEmployee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
        centerTitle: true,
      ),
    );
  }
}
