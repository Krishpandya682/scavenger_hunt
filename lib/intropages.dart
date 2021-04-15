import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scavanger_hunt/InAndOutPages.dart';
import 'package:scavanger_hunt/QnA.dart';

import 'main.dart';

class IntroPages extends StatefulWidget {
  @override
  _IntroPagesState createState() => _IntroPagesState();
}

class _IntroPagesState extends State<IntroPages> {
  List<InPages> inPagesList = InPages.getInPages();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(inPagesList.asMap()[stageNum - 1].title),
        ),
        body: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: QnA.getImageWidget(
                        inPagesList.asMap()[stageNum - 1].imgName),
                  ),
                  Container(
                    padding: EdgeInsets.all(30),
                    child: Text(
                      inPagesList.asMap()[stageNum - 1].text,
                      style: Theme.of(context).textTheme.bodyText1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PuzzlePage()));
                    },
                    child: Text("Continue"),
                  ),
                ]),
          ),
        ));
  }
}
