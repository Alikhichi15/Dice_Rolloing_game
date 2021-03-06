import 'dart:async';
import 'package:flutter/material.dart';
import 'homepage.dart';

//import 'package:quizstar/home.dart';

class splashscreen extends StatefulWidget {
  @override
  _splashscreenState createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => homepage(),
      ));
    });
  }

  // added test yourself
  // and made the text to align at center
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent[700],
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80.0,
                backgroundImage: AssetImage('images/profileimage.png'),
              ),
              Text(
                "Ali Khichi",
                style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.white,
                    fontFamily: 'Pacifico'),
              ),
              Text(
                "Flutter Developer",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.teal.shade100,
                    fontFamily: 'SourceSansPro',
                    letterSpacing: 2.5),
              ),
              SizedBox(
                height: 20.0,
                width: 200.0,
                child: Divider(
                  color: Colors.teal[100],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 25,
                ),
                child: Card(
                  color: Colors.white,
                  elevation: 22.0,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 13),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  margin:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                  child: Center(
                    child: ListTile(
                      leading: Icon(
                        Icons.account_circle,
                        color: Colors.teal,
                      ),
                      title: Text(
                        'FA18_BCS_015',
                        style: TextStyle(
                          fontFamily: 'SourceSansPro',
                          color: Colors.teal[900],
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 25,
                ),
                // child: Card(
                //     color: Colors.white,
                //     elevation: 22.0,
                //     margin:
                //         EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                //     child: ListTile(
                //       leading: Icon(
                //         Icons.mail,
                //         color: Colors.teal,
                //       ),
                //       title: Text(
                //         'alikhichi766@gmail.com',
                //         style: TextStyle(
                //           fontFamily: 'SourceSansPro',
                //           color: Colors.teal[900],
                //           fontSize: 15.0,
                //         ),
                //       ),
                //     )),
              ),
            ],
          ),
        ));
  }
}
