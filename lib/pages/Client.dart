import 'package:flutter/material.dart';

class ClientList extends StatefulWidget {
  @override
  _ClientListState createState() => _ClientListState();
}

class _ClientListState extends State<ClientList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Client"),
        centerTitle: true,
      ),
    );
  }
}
