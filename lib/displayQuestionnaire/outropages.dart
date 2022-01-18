import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'InAndOutPages.dart';
import 'PasswordPage.dart';

class OutroPages extends StatefulWidget {
  @override
  _OutroPagesState createState() => _OutroPagesState();
}

class _OutroPagesState extends State<OutroPages> {
  List<OutPages> outPagesList = OutPages.getOutPages();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(outPagesList.asMap()[stageNum - 1].title),
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
                          child: outPagesList.asMap()[stageNum - 1].widget),
                      Container(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          outPagesList.asMap()[stageNum - 1].text,
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
