import 'package:flutter/material.dart';
import '/models/catalog.dart';
import '/widgets/bottomBar.dart';
import '/widgets/drawer.dart';
import '/widgets/item_widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Zeal Industries"),
      ),
      body: ListView.builder(
        itemCount: CatalogModel.items.length,
        itemBuilder: (context, index) {
          return ItemWidget(
            item: CatalogModel.items[index],
          );
        },
      ),
      drawer: MyDrawer(),
      bottomNavigationBar: MyBootomBar(),
    );
  }
}
