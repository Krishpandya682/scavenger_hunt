import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scavanger_hunt/createQuestionnaire/numericalValues.dart';
import 'PasswordPage.dart';
import 'displayHomePage2.dart';

class OutroPages extends StatefulWidget {
  @override
  _OutroPagesState createState() => _OutroPagesState();
}

class _OutroPagesState extends State<OutroPages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(data['OutroTitle' + secNum.toString()]),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30.0),
            child: Container(
              padding: EdgeInsets.all(30.0),
              child: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          child: Text(data['OutroImage' + secNum.toString()])),
                      Container(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          data['OutroText' + secNum.toString()],
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PasswordPage()));
                        },
                        child: Text("Continue"),
                      ),
                    ]),
              ),
            ),
          ),
        ));
  }
}
