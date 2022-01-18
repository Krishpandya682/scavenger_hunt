import 'package:flutter/material.dart';
import 'package:scavanger_hunt/QnA.dart';
import 'package:scavanger_hunt/shared/constants.dart';

import 'outropages.dart';

int levelNum = 1;

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
