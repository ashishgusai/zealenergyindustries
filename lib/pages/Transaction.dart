import 'package:flutter/material.dart';
import 'package:zealenergyindustries/pages/Add_transaction.dart';
import 'package:zealenergyindustries/utils/expansion_card.dart';
import 'package:zealenergyindustries/utils/routes.dart';

class TransactionWidget extends StatefulWidget {
  @override
  _TransactionWidget createState() => _TransactionWidget();
}

class _TransactionWidget extends State<TransactionWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
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

            trailing: Text("IN"),
            title: Text("Party Name"),
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
                    Expanded(flex: 4, child: Text('Zeal Filled Cylinder')),
                    Expanded(flex: 1, child: Text('X10')),
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
                    Expanded(flex: 4, child: Text('Total')),
                    Expanded(flex: 1, child: Text('X20')),
                  ],
                ),
                color: Colors.deepPurple[50],
              ),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(18, 4, 18, 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Material(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: () {},
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            height: 50,
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.print,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Print",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      flex: 1,
                      child: Material(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(8),
                        child: InkWell(
                          onTap: () {},
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            height: 50,
                            alignment: Alignment.center,
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.edit,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Edit",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.addTransaction);
          print("helllo");
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.deepPurple,
      ),
    );
  }
}
