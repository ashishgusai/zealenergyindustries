import 'package:flutter/material.dart';

class MyBootomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
        BottomNavigationBarItem(
          label: "Cylinder",
          icon: Icon(Icons.battery_std_rounded),
        ),
        BottomNavigationBarItem(
          label: "Transaction",
          icon: Icon(Icons.account_balance_wallet_rounded),
        ),
      ],
    );
  }
}
