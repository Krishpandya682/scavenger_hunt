import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scavanger_hunt/createQuestionnaire/sectionOutro.dart';
import 'package:scavanger_hunt/models/user.dart';
import 'package:scavanger_hunt/shared/constants.dart';
import 'package:scavanger_hunt/Services/database.dart';
import 'package:provider/provider.dart';

import 'numericalValues.dart';

class QuestionAndAnswer extends StatefulWidget {
  @override
  _QuestionAndAnswerState createState() => _QuestionAndAnswerState();
}

class _QuestionAndAnswerState extends State<QuestionAndAnswer> {
  @override
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String extra = '';
  String question = '';
  String answer = '';
  String error = '';

  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.5,
        title:
            Text('QnA Page ' + secNum.toString() + '.' + questNum.toString()),
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Extra ' + questNum.toString()),
                    validator: (val) => val!.isEmpty ? 'Enter extra' : null,
                    onChanged: (val) {
                      setState(() => extra = val);
                    }),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Question ' + questNum.toString()),
                    validator: (val) =>
                        val!.isEmpty ? 'Enter a question' : null,
                    onChanged: (val) {
                      setState(() => question = val);
                    }),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Answer ' + questNum.toString()),
                    validator: (val) => val!.isEmpty ? 'Enter an answer' : null,
                    onChanged: (val) {
                      setState(() => answer = val);
                    }),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        print(extra);
                        print(question);
                        print(answer);

                        await DatabaseService(uid: user.uid).addQuestion(
                            secNum, questNum, extra, question, answer);

                        if (questNum % QUESTS_PER_SECT == 0) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SectionOutro()));
                        } else {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QuestionAndAnswer()));
                        }
                        questNum++;
                      }
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),
                )
              ],
            ),
          )),
    );
  }
}
