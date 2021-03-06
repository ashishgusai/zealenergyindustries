import 'package:flutter/material.dart';

class EmployeeEditPage extends StatefulWidget {
  @override
  _EmployeeEditPageState createState() => _EmployeeEditPageState();
}

class _EmployeeEditPageState extends State<EmployeeEditPage> {
  Decoration mystyle = BoxDecoration(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        new BoxShadow(color: Colors.grey, blurRadius: 10.0, spreadRadius: 3.0),
      ]);
  final imageUrl =
      "https://st2.depositphotos.com/1104517/11965/v/600/depositphotos_119659092-stock-illustration-male-avatar-profile-picture-vector.jpg";
  String? fname = "vatsal"; //take dynamic data
  String? lname = "shah"; //take dynamic data
  String? email = "vatsals@gmail.com"; //take dynamic data
  String? number = "8200726159"; //take dynamic data
  bool buttonneed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        children: [
          SizedBox(height: 40),
          Container(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 60),
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  decoration: mystyle,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        "Vatsal Shah", //name
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 1),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Vatsals507@gmail.com", //username
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            letterSpacing: 1),
                      ), //dynamic
                    ],
                  ),
                ),
                Center(
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    radius: 50,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            decoration: mystyle,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Personal",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 1),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    initialValue: fname,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      hintText: 'First Name',
                      hintStyle: TextStyle(
                        color: Colors.white38,
                      ),
                      // contentPadding: EdgeInsets.all(10),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onChanged: (value) => {
                      setState(() {
                        buttonneed = true;
                      })
                    },
                    onSaved: (value) {
                      fname = value.toString();
                    },
                    validator: (value) {
                      return (value != null)
                          ? 'Please Enter The Details.'
                          : null;
                    },
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    //controller: fname,
                    cursorColor: Colors.white,
                    initialValue: lname,

                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      hintText: 'Last Name',
                      hintStyle: TextStyle(
                        color: Colors.white38,
                      ),
                      // contentPadding: EdgeInsets.all(10),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onChanged: (value) => {
                      setState(() {
                        buttonneed = true;
                      })
                    },
                    onSaved: (value) {
                      lname = value.toString();
                    },
                    validator: (value) {
                      return (value != null)
                          ? 'please enter the details.'
                          : null;
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            decoration: mystyle,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Contact",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 1),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    initialValue: number,
                    enabled: true,
                    //controller: fname,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      hintText: 'Phone Number',
                      hintStyle: TextStyle(
                        color: Colors.white38,
                      ),
                      // contentPadding: EdgeInsets.all(10),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onSaved: (value) {
                      number = value.toString();
                    },
                    onChanged: (value) => {
                      setState(() {
                        buttonneed = true;
                      })
                    },
                    validator: (value) {
                      return (value != null)
                          ? 'please enter the details.'
                          : null;
                    },
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    initialValue: email,
                    enabled: true,
                    //controller: fname,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      labelText: 'Email ID',
                      labelStyle: TextStyle(
                        color: Colors.white,
                      ),
                      hintText: 'Email ID',
                      hintStyle: TextStyle(
                        color: Colors.white38,
                      ),
                      // contentPadding: EdgeInsets.all(10),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.white,
                        ),
                      ),
                      disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          width: 1.5,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onSaved: (value) {
                      email = value.toString();
                    },
                    onChanged: (value) => {
                      setState(() {
                        buttonneed = true;
                      })
                    },
                    validator: (value) {
                      return (value != null)
                          ? 'please enter the details.'
                          : null;
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Material(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: () {
                buttonneed
                    ? print("vatsal shah saved")
                    : print("vatsal shah unsaved");
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
    );
  }
}
