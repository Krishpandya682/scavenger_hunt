import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:scavanger_hunt/QnA.dart';
import 'package:scavanger_hunt/shared/constants.dart';

import 'intropages.dart';
import '../main.dart';
import 'PuzzlePage.dart';

int stageNum = 1;

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
