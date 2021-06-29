import 'package:flutter/material.dart';

import '/widgets/bottomBar.dart';
import '/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Zeal Industries"),
      ),
      body: Container(),
      drawer: MyDrawer(),
      bottomNavigationBar: MyBootomBar(),
    );
  }
}
