import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scavanger_hunt/QnA.dart';
import 'package:scavanger_hunt/Services/auth.dart';
import 'package:scavanger_hunt/intropages.dart';
import 'package:scavanger_hunt/models/user.dart';
import 'package:scavanger_hunt/outropages.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:scavanger_hunt/wrapper.dart';

int levelNum = 1;
int stageNum = 1;
const int LEVELS_PER_STAGE = 3;
const int TOTAL_STAGES = 4;
final snackBar = SnackBar(content: Text('Wrong...Try Again!'));
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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

class HomePage extends StatelessWidget {
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
        ));
  }
}

class PuzzlePage extends StatefulWidget {
  @override
  _PuzzlePageState createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  List<QnA> questions = QnA.getQuestions();
  TextEditingController _answerController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Puzzle Number $levelNum',
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: questions.asMap()[levelNum - 1].extraWidget,
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Center(
                    child: Text(
                  "${questions.asMap()[levelNum - 1].question}",
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center,
                )),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Center(
                    child: TextField(
                  controller: _answerController,
                  decoration: InputDecoration(hintText: "Answer"),
                )),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Center(
                    child: ElevatedButton(
                  onPressed: () {
                    if (_answerController.text.toLowerCase() ==
                        questions.asMap()[levelNum - 1].answer.toLowerCase()) {
                      if (levelNum % LEVELS_PER_STAGE == 0) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OutroPages()));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PuzzlePage()));
                      }
                      levelNum++;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text(
                    "Submit Answer",
                  ),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  TextEditingController _passwordController = TextEditingController();
  List<int> passwords = QnA.getPasswords();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Password $stageNum',
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(30),
                child: Center(
                    child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(hintText: "Password"),
                )),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Center(
                    child: ElevatedButton(
                  onPressed: () {
                    if (stageNum >= TOTAL_STAGES) {
                      stageNum = 1;
                      levelNum = 1;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FinishedPage()));
                      return;
                    }
                    if (int.parse(_passwordController.text) ==
                        passwords.asMap()[stageNum - 1]) {
                      stageNum++;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => IntroPages()));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text(
                    "Submit Password",
                  ),
                )),
              ),
            ],
          ),
        ),
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
      body: Container(
          child: Center(
        child: QnA.getImageWidget("img.jpg"),
      )),
    );
  }
}
