import 'package:flutter/material.dart';

TextEditingController _textFieldController = TextEditingController();
Future<void> displayTextInputDialog(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Change Password'),
          content: TextField(
            obscureText: true,
            onChanged: (value) {
              valueText = value;
            },
            controller: _textFieldController,
            decoration: InputDecoration(hintText: "New Password"),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                codeDialog = valueText;
                Navigator.pop(context);
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      });
}

String? codeDialog;
String? valueText;

//permission

Future<void> displayCheckBoxDialog(BuildContext context) async {
  bool isCheckedUser = true;
  bool isCheckedCylinder = false;
  bool isCheckedCylinderTransaction = false;
  return showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(// StatefulBuilder
            builder: (context, setState) {
          return AlertDialog(
            title: Text('Change Permission'),
            content: Container(
              height: 170,
              child: Column(
                children: [
                  CheckboxListTile(
                      title: Text("Users"),
                      value: isCheckedUser,
                      onChanged: (value) {
                        setState(() {
                          isCheckedUser = value!;
                        });
                      }),
                  CheckboxListTile(
                      title: Text("Cylinder"),
                      value: isCheckedCylinder,
                      onChanged: (value) {
                        setState(() {
                          isCheckedCylinder = value!;
                        });
                      }),
                  CheckboxListTile(
                      title: Text("Cylinder Transactions"),
                      value: isCheckedCylinderTransaction,
                      onChanged: (value) {
                        setState(() {
                          isCheckedCylinderTransaction = value!;
                        });
                      }),
                ],
              ),
            ),
            // content: TextField(
            //   obscureText: true,
            //   onChanged: (value) {
            //     valueText = value;
            //   },
            //   controller: _textFieldController,
            //   decoration: InputDecoration(hintText: "New Password"),
            // ),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  codeDialog = valueText;
                  Navigator.pop(context);
                },
                child: const Text('Confirm'),
              ),
            ],
          );
        });
      });
}
