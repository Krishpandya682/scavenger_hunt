import 'package:flutter/material.dart';
import 'package:scavanger_hunt/displayQuestionnaire/displayHomePage.dart';
import 'package:scavanger_hunt/displayQuestionnaire/displayHomePage2.dart';
import 'createQuestionnaire/createHomePage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Center(
          child: Column(children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateHomePage()));
              },
              child: Text(
                "Create a Questionnaire",
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    // MaterialPageRoute(builder: (context) => DisplayHomePage()));
                    MaterialPageRoute(
                        builder: (context) => DisplayHomePage2()));
              },
              child: Text(
                "Answer a Questionnaire",
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
