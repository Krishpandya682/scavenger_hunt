import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scavanger_hunt/HomePage.dart';
import 'package:scavanger_hunt/Services/auth.dart';
import 'package:scavanger_hunt/authentication/authenticate/sign_in.dart';
import 'package:scavanger_hunt/createQuestionnaire/numericalValues.dart';
import '../Services/database.dart';

class CreateFinishPage extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scavenger Hunt"),
        actions: <Widget>[
          TextButton.icon(
            icon: Icon(Icons.person),
            label: Text('logout'),
            onPressed: () async {
              await _auth.signOut();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SignIn()));
            },
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 70),
                  child: Text(
                    "You have seccessfully created a questionaire, \n\nYou will now be able to give this questionnaire to your desired audience... \n\nHave Fun!!",
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: Text(
                    "Let\'s begin",
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
