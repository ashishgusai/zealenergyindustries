import 'package:flutter/material.dart';
import 'package:zealenergyindustries/controller/controller.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Decoration mystyle = BoxDecoration(
      color: Colors.deepPurple,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        new BoxShadow(color: Colors.grey, blurRadius: 10.0, spreadRadius: 3.0),
      ]);
  final imageUrl =
      "https://st2.depositphotos.com/1104517/11965/v/600/depositphotos_119659092-stock-illustration-male-avatar-profile-picture-vector.jpg";
  String? fname = ""; //take dynamic data
  String? lname = ""; //take dynamic data
  String? email = ""; //take dynamic data
  String? number = ""; //take dynamic data
  bool buttonneed = false;

  getProfiledata() async {
    var response = await postApiCallProfile(adminProfile);
    print(response);

    print(response["message"]);
    print(response["status"].toString());
    fname = response["data"]["first_name"];
    lname = response["data"]["last_name"];
    email = response["data"]["email"];
    number = response["data"]["contact_number"];
    setState(() {});
  }

  bool checkData() {
    if (fname != "") {
      return true;
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    getProfiledata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          centerTitle: true,
        ),
        body: checkData()
            ? ListView(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
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
                                fname! + lname!, //name
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
                                email!, //username
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
                    height: 230,
                    decoration: mystyle,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
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
                            initialValue: fname!,
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
                            initialValue: lname!,

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
                          SizedBox(height: 10),
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
                                        text: buttonneed
                                            ? "Save Details"
                                            : "Edit Details",
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
                  SizedBox(height: 20),
                  Container(
                    height: 200,
                    decoration: mystyle,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 16.0),
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
                            enabled: false,
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
                            validator: (value) {
                              return (value != null)
                                  ? 'please enter the details.'
                                  : null;
                            },
                          ),
                          TextFormField(
                            style: TextStyle(color: Colors.white),
                            initialValue: email,
                            enabled: false,
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
                  )
                ],
              )
            : Center(child: CircularProgressIndicator()));
  }
}
