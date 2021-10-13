import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            shadowColor: Colors.pink,
            backgroundColor: Colors.redAccent[700],
            centerTitle: true,
            title: Text(
              'Dice Role',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
              ),
            ),
          ),
          body: Dicepage(),
        ),
      ),
    );
  }
}

class Dicepage extends StatefulWidget {
  @override
  _DicepageState createState() => _DicepageState();
}

class _DicepageState extends State<Dicepage> {
  var leftdice = 4;
  var rightdice = 5;
  int counter = 0;
  var highscore = 0;
  highscor() {
    highscore = counter;
  }

  resetcounter() {
    counter = 0;
    print('res');
    print(counter);
  }

  void incrementCounter() {
    counter++;
    print('inc');
    print(counter);
    if (counter > highscore) {
      highscor();
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    // Widget cancelButton = FlatButton(
    //   child: Text("Cancel"),
    //   onPressed: () {
    //     // SystemChannels.navigation.;
    //     exit(0);
    //   },
    // );
    Widget continueButton = FlatButton(
      child: Text("Continue"),
      onPressed: () {
        Navigator.pop(context, true);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Game Over"),
      content: Text("Would you like to continue Playing"),
      actions: [
        //cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void Diceface() {
    setState(() {
      leftdice = Random().nextInt(6) + 1;
      rightdice = Random().nextInt(6) + 1;
      print(rightdice);
      print(leftdice);
      if (rightdice == leftdice) {
        resetcounter();
        showAlertDialog(context);
      }
    });
  }

  //we have to decl veriale in side state<Disecpage> to work
  @override
  Widget build(BuildContext context) {
    //every thing that have something to do only works inside build method
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: FlatButton(
                    onPressed: () {
                      incrementCounter();
                      Diceface();
                    },
                    child: Image(
                      image: AssetImage('images/dice$leftdice.png'),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  flex: 3,
                  child: FlatButton(
                    onPressed: () {
                      Diceface();
                      incrementCounter();
                    },
                    child: Image(
                      image: AssetImage('images/dice$rightdice.png'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Container(
                    margin: EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        Text(
                          'Score: $counter',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: 40.0,
                        ),
                        Text(
                          'High Score: $highscore',
                          style: TextStyle(
                            fontSize: 30.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
