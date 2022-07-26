// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:scavanger_hunt/Services/auth.dart';
// import 'package:scavanger_hunt/displayQuestionnaire/PasswordPage.dart';
// import 'package:scavanger_hunt/displayQuestionnaire/PuzzlePage.dart';
// import 'package:scavanger_hunt/models/user.dart';
// import 'intropages.dart';
// import '../Services/database.dart';
// import 'welcome.dart';
// import 'package:scavanger_hunt/models/questionnaire.dart';
// import 'package:provider/provider.dart';
//
// class DisplayHomePage extends StatelessWidget {
//   final AuthService _auth = AuthService();
//   @override
//   Widget build(BuildContext context) {
//     final user = Provider.of<MyUser>(context);
//     var userData;
//     var ame;
//     var x = DatabaseService(uid: user.uid).readData(userData);
//     x.then((value) => print("Value is ==>" + value.toString()));
//     // print("User Data is =>" + userData.toString());
//     // print(x['audienceName']);
//     return StreamProvider<List<Questionnaire>>.value(
//       value: DatabaseService().questionnaire,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text("Scavenger Hunt"),
//           actions: <Widget>[
//             TextButton.icon(
//               icon: Icon(Icons.person),
//               label: Text('logout'),
//               onPressed: () async {
//                 await _auth.signOut();
//               },
//             )
//           ],
//         ),
//         body: Center(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.all(30.0),
//             child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.fromLTRB(0, 30, 0, 70),
//                     child: Welcome(),
//                   ),
//                   ElevatedButton(
//                     onPressed: () {
//                       levelNum = 1;
//                       stageNum = 1;
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => IntroPages()));
//                     },
//                     child: Text(
//                       "Let\'s begin",
//                     ),
//                   ),
//                 ]),
//           ),
//         ),
//       ),
//     );
//   }
// }
