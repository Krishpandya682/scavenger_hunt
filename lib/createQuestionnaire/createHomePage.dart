import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scavanger_hunt/Services/auth.dart';
import 'package:scavanger_hunt/authentication/authenticate/sign_in.dart';
import 'package:scavanger_hunt/createQuestionnaire/numericalValues.dart';
import '../Services/database.dart';

class CreateHomePage extends StatelessWidget {
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
                    "Welcome To the Questionnaire Creation Page, \n\nYou will now be able to create a custom questionnaire for your desired audience... \n\nHave Fun!!",
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NumericalValues()));
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
