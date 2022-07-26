import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scavanger_hunt/createQuestionnaire/numericalValues.dart';
import 'PasswordPage.dart';
import 'PuzzlePage.dart';
import '../main.dart';
import 'displayHomePage2.dart';

class IntroPages extends StatefulWidget {
  @override
  _IntroPagesState createState() => _IntroPagesState();
}

class _IntroPagesState extends State<IntroPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data['IntroTitle' + secNum.toString()]),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    //**********************CREATE IMAGE GETTER*******************//
                    child: Text(data['IntroImage' + secNum.toString()]),
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      data['IntroText' + secNum.toString()],
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print("Going to PuzzlePage");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PuzzlePage()));
                    },
                    child: Text("Continue"),
                  ),
                ]),
          ),
        ));
  }
}
