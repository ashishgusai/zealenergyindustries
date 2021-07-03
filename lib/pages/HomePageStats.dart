import 'package:flutter/material.dart';
import 'package:zealenergyindustries/models/homePageTiles.dart';
import 'package:zealenergyindustries/utils/expansion_card.dart';
import 'package:zealenergyindustries/widgets/dashBoardTileWidget.dart';

class HomeStats extends StatefulWidget {
  @override
  _HomeStatsState createState() => _HomeStatsState();
}

class _HomeStatsState extends State<HomeStats> {
  String expansionHeading = "+ Rs. 500";
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      //controller: controller,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
                shrinkWrap: true,
                children: List.generate(
                  cardTile.length,
                  (index) {
                    return DashBoardTile(
                      counter: cardTile[index].counter,
                      details: cardTile[index].details,
                      iconsused: cardTile[index].iconsused,
                    );
                  },
                ),
              ),
            ),
            //SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 24),
              child: Text(
                "Recent Transactions",
                style: TextStyle(
                    color: Colors.deepPurple[400],
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),

            ListView(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              primary: false,
              shrinkWrap: true,
              children: <Widget>[
                ExpansionCard(
                  textColor: Colors.white,
                  collapsedTextColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                  collapsedBackgroundColor: Colors.deepPurple,
                  initiallyExpanded: false,
                  onExpansionChanged: (value) {
                    value
                        ? expansionHeading = "22-05-2021"
                        : expansionHeading = " + Rs. 500";
                    setState(() {});
                  },
                  trailing: Text(expansionHeading),
                  title: Text("Buyer Name"),
                  //subtitle: Text("Buyer Name"),
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(18, 12, 18, 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(flex: 1, child: Text('Driver Name')),
                          Expanded(flex: 1, child: Text('Driver No.')),
                          Expanded(flex: 1, child: Text('Vehicle No.')),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[50],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(18, 12, 18, 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 2, child: Text('Zeal Filled Cylinder')),
                          Expanded(flex: 1, child: Text('X10')),
                          Expanded(flex: 1, child: Text('Rs. 500')),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[50],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(18, 12, 18, 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(flex: 2, child: Text('Total')),
                          Expanded(flex: 1, child: Text('X20')),
                          Expanded(flex: 1, child: Text('Rs. 500')),
                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.deepPurple[50],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}
