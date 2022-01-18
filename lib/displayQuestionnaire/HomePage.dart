import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scavanger_hunt/Services/auth.dart';
import 'intropages.dart';
import '../Services/database.dart';

class HomePage extends StatelessWidget {
  final AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot>.value(
      value: DatabaseService().questionnaire,
      child: Scaffold(
          appBar: AppBar(
            title: Text("Scavenger Hunt"),
            actions: <Widget>[
              TextButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
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
                        "Welcome To the Scavenger Hunt, \n\nYou will now receive a series of clues..the answers to which will lead you to passwords that will help you move forward... \n\nHave Fun!!",
                        style: Theme.of(context).textTheme.bodyText1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => IntroPages()));
                      },
                      child: Text(
                        "Let\'s begin",
                      ),
                    ),
                  ]),
            ),
          )),
    );
  }
}
