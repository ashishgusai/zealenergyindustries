import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

enum SingingCharacter { IN, OUT }

class AddTransaction extends StatefulWidget {
  @override
  _AddTransactionState createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  final formKey = GlobalKey<FormState>();

  RegExp regExp = new RegExp(
    r"^[A-Z]{2}[ -][0-9]{1,2}(?: [A-Z])?(?: [A-Z]*)? [0-9]{4}$",
    caseSensitive: false,
    multiLine: false,
  );

  TextEditingController partyName = TextEditingController();
  TextEditingController driverName = TextEditingController();
  TextEditingController driverNumber = TextEditingController();
  TextEditingController vehicleNumber = TextEditingController();
  TextEditingController zealFilled = TextEditingController();
  TextEditingController zealEmpty = TextEditingController();
  TextEditingController pcFilled = TextEditingController();
  TextEditingController pcEmpty = TextEditingController();

  SingingCharacter? _character = SingingCharacter.IN;

  List<Widget> iconSpacing(IconData icon) {
    return [
      Container(
        padding: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
      SizedBox(width: 10)
    ];
  }

  bool inout = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Transaction"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          //height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(24),
          child: Form(
            key: formKey,
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    iconSpacing(Icons.account_balance_wallet)[0],
                    iconSpacing(Icons.account_balance_wallet)[1],
                    Text(
                      "Transaction Details",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  onChanged: (value) => {
                    setState(() {
                      // name = value;
                    })
                  },
                  controller: partyName,
                  decoration: InputDecoration(
                      hintText: "Party Name", labelText: "Party Name"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Can't be Empty";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Text(
                  "Transaction Type",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: RadioListTile<SingingCharacter>(
                        title: const Text('IN'),
                        value: SingingCharacter.IN,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: RadioListTile<SingingCharacter>(
                        title: const Text('OUT'),
                        value: SingingCharacter.OUT,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    iconSpacing(Icons.assignment_ind_outlined)[0],
                    iconSpacing(Icons.assignment_ind_outlined)[1],
                    Text(
                      "Driver Details",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  onChanged: (value) => {
                    setState(() {
                      // name = value;
                    })
                  },
                  controller: driverName,
                  decoration: InputDecoration(
                      hintText: "Driver Name", labelText: "Driver Name"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Can't be Empty";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  onChanged: (value) => {
                    setState(() {
                      // name = value;
                    })
                  },
                  controller: driverNumber,
                  decoration: InputDecoration(
                      hintText: "Driver Number", labelText: "Driver Number"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Can't be Empty";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  onChanged: (value) => {
                    setState(() {
                      // name = value;
                    })
                  },
                  controller: vehicleNumber,
                  decoration: InputDecoration(
                      hintText: "Vehicle Number", labelText: "Vehicle Number"),
                  validator: (value) {
                    print("Vatsal " + regExp.hasMatch(value!).toString());
                    if (value.isEmpty) {
                      return "Can't be Empty";
                    }
                    if (!regExp.hasMatch(value)) {
                      return "Check Format";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    iconSpacing(Icons.battery_charging_full_outlined)[0],
                    iconSpacing(Icons.battery_charging_full_outlined)[1],
                    Text(
                      "Cylinder Details",
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 22,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Zeal Cylinder",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) => {
                          setState(() {
                            // name = value;
                          })
                        },
                        controller: zealFilled,
                        decoration: InputDecoration(
                            hintText: "Filled", labelText: "Filled"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Can't be Empty";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) => {
                          setState(() {
                            // name = value;
                          })
                        },
                        controller: zealEmpty,
                        decoration: InputDecoration(
                            hintText: "Empty", labelText: "Empty"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Can't be Empty";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "PC Cylinder",
                  style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 18,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) => {
                          setState(() {
                            // name = value;
                          })
                        },
                        controller: pcFilled,
                        decoration: InputDecoration(
                            hintText: "Filled", labelText: "Filled"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Can't be Empty";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) => {
                          setState(() {
                            // name = value;
                          })
                        },
                        controller: pcEmpty,
                        decoration: InputDecoration(
                            hintText: "Empty", labelText: "Empty"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Can't be Empty";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Material(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(8),
                  child: InkWell(
                    onTap: () {
                      formKey.currentState!.validate();
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      height: 50,
                      alignment: Alignment.center,
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Save Details",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                            WidgetSpan(
                              child: Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                                size: 18,
                              ),
                              alignment: PlaceholderAlignment.middle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
