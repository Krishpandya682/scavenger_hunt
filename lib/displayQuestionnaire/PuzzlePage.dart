import 'package:flutter/material.dart';
import 'package:scavanger_hunt/createQuestionnaire/numericalValues.dart';
import 'package:scavanger_hunt/shared/constants.dart';

import 'displayHomePage2.dart';
import 'outropages.dart';

class PuzzlePage extends StatefulWidget {
  @override
  _PuzzlePageState createState() => _PuzzlePageState();
}

class _PuzzlePageState extends State<PuzzlePage> {
  TextEditingController _answerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Question Number $questNum',
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(data['Extra' + questNum.toString()]),
              ),
              Container(
                padding: EdgeInsets.all(30),
                child: Center(
                    child: Text(
                  "${data['Question' + questNum.toString()]}",
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
                    print(data);
                    print("Answer => " + data['Answer' + questNum.toString()]);
                    if (_answerController.text.toLowerCase() ==
                        data['Answer' + questNum.toString()].toLowerCase()) {
                      if (questNum % data['numQuesPerSec'] == 0) {
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
                      questNum++;
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
