import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zealenergyindustries/models/homePageTiles.dart';
import 'package:zealenergyindustries/pages/HomePageStats.dart';
import 'package:zealenergyindustries/pages/Transaction.dart';
import 'package:zealenergyindustries/utils/expansion_card.dart';
import 'package:zealenergyindustries/widgets/dashBoardTileWidget.dart';

import '/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var index = 0;
  Widget change = HomeStats();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Zeal Industries"),
      ),
      body: change,
      drawer: MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          index = value;
          if (value == 0) {
            change = HomeStats();
          } else {
            change = TransactionWidget();
            //Navigator.pushNamed(context, MyRoutes.transaction);
          }

          setState(() {});
        },
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
          // BottomNavigationBarItem(
          //   label: "Sell",
          //   icon: Icon(Icons.battery_std_rounded),
          // ),
          BottomNavigationBarItem(
            label: "Transactions",
            icon: Icon(Icons.account_balance_wallet_rounded),
          ),
        ],
      ),
    );
  }
}
