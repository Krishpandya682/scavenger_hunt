import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:scavanger_hunt/createQuestionnaire/numericalValues.dart';
import 'package:scavanger_hunt/displayQuestionnaire/displayHomePage2.dart';

import 'package:scavanger_hunt/shared/constants.dart';

import 'intropages.dart';
import '../main.dart';
import 'PuzzlePage.dart';

class PasswordPage extends StatefulWidget {
  @override
  _PasswordPageState createState() => _PasswordPageState();
}

class _PasswordPageState extends State<PasswordPage> {
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Password $secNum',
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
                    print(data['Password' + secNum.toString()].runtimeType);
                    print(int.parse(_passwordController.text).runtimeType);
                    if (secNum >= data['numSections']) {
                      secNum = 1;
                      questNum = 1;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FinishedPage()));
                      return;
                    }
                    if (int.parse(_passwordController.text).toString() ==
                        data['Password' + secNum.toString()]) {
                      secNum++;
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
