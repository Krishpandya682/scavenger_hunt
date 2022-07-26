import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scavanger_hunt/Services/auth.dart';
import 'package:scavanger_hunt/authentication/authenticate/sign_in.dart';
import 'package:scavanger_hunt/createQuestionnaire/numericalValues.dart';
import 'package:scavanger_hunt/displayQuestionnaire/PasswordPage.dart';
import 'package:scavanger_hunt/displayQuestionnaire/PuzzlePage.dart';
import 'package:scavanger_hunt/models/user.dart';
import 'package:scavanger_hunt/shared/loading.dart';
import 'intropages.dart';
import '../Services/database.dart';
import 'welcome.dart';
import 'package:scavanger_hunt/models/questionnaire.dart';
import 'package:provider/provider.dart';

var data;

class DisplayHomePage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    final user = Provider.of<MyUser>(context);
    return FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: downloadData(user.uid), // function where you call your api
      builder: (BuildContext context,
          AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>> snapshot) {
        // AsyncSnapshot<Your object type>
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading();
        } else {
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));
          else
            data = snapshot.data.data();
          return Center(
              child: Scaffold(
            appBar: AppBar(
              title: Text("Scavenger Hunt"),
              actions: <Widget>[
                TextButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('logout'),
                  onPressed: () async {
                    await _auth.signOut();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
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
                        child: Welcome()
                            .welcomePage(context, data['audienceName']),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          questNum = 1;
                          secNum = 1;
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
            ),
          )); // snapshot.data  :- get your object which is pass from your downloadData() function
        }
      },
    );
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> downloadData(uid) async {
    return await FirebaseFirestore.instance
        .collection('questionnaire')
        .doc(uid)
        .get();
  }
}
