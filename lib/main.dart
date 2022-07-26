import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scavanger_hunt/HomePage.dart';
import 'package:scavanger_hunt/Services/auth.dart';
import 'package:scavanger_hunt/models/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scavanger_hunt/wrapper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MyUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: FutureBuilder(
          future: _fbApp,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Text("Error with database, try again");
            } else if (snapshot.hasData) {
              return Wrapper();
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        theme: ThemeData(
            backgroundColor: Color(0xff121212),
            elevatedButtonTheme: ElevatedButtonThemeData(
                style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10.0),
              primary: Colors.black,
              textStyle: TextStyle(
                color: Colors.white,
                fontFamily: 'PlayFair',
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
                letterSpacing: 1.5,
              ),
              shadowColor: Colors.black12,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            )),
            appBarTheme: AppBarTheme(
                backgroundColor: Color(0xff2a2b2d),
                centerTitle: true,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontFamily: 'PlayFair',
                  fontWeight: FontWeight.bold,
                )),
            primaryColor: Colors.black,
            accentColor: Color(0xff3c3f41),
            textTheme: TextTheme(
              bodyText1: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontFamily: 'PlayFair',
                fontSize: 20.0,
                letterSpacing: 2,
              ),
            )),
      ),
    );
  }
}

class FinishedPage extends StatefulWidget {
  @override
  _FinishedPageState createState() => _FinishedPageState();
}

class _FinishedPageState extends State<FinishedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffff5e0109),
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: Text(
              "Thanks for using the Scavenger Hunt App, \n\nHope you had fun \n\nSee You Again!!",
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text(
              "Go Home",
            ),
          ),
        ],
      ),
    );
  }
}
