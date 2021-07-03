import 'package:flutter/material.dart';

class DashBoardTile extends StatelessWidget {
  final IconData? iconsused;
  final String? details;
  final String? counter;

  const DashBoardTile({Key? key, this.iconsused, this.details, this.counter})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        padding: EdgeInsets.all(12),
        alignment: Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Icon(
                  iconsused,
                  size: 30,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: Text(
                counter!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Text(
                details!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              "Tap To View",
              style: TextStyle(
                color: Colors.white54,
                fontSize: 8,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
