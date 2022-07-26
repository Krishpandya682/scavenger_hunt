import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scavanger_hunt/createQuestionnaire/questionAndAnswer.dart';
import 'package:scavanger_hunt/models/user.dart';
import 'package:scavanger_hunt/shared/constants.dart';
import 'package:scavanger_hunt/Services/database.dart';
import 'package:provider/provider.dart';

import 'numericalValues.dart';

class SectionIntro extends StatefulWidget {
  @override
  _SectionIntroState createState() => _SectionIntroState();
}

class _SectionIntroState extends State<SectionIntro> {
  @override
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String introTitle = '';
  String introImgName = '';
  String introText = '';

  String error = '';

  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.5,
        title: Text('Intro Page ' + secNum.toString()),
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
                        hintText: 'Intro ' + secNum.toString() + ' Title'),
                    validator: (val) => val.isEmpty ? 'Enter a title' : null,
                    onChanged: (val) {
                      setState(() => introTitle = val);
                    }),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Intro ' + secNum.toString() + ' Image'),
                    validator: (val) => val.isEmpty ? 'Enter an Img' : null,
                    onChanged: (val) {
                      setState(() => introImgName = val);
                    }),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Intro ' + secNum.toString() + ' Text'),
                    validator: (val) => val.isEmpty ? 'Enter some text' : null,
                    onChanged: (val) {
                      setState(() => introText = val);
                    }),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        setState(() {
                          loading = true;
                        });
                        print(introTitle);
                        print(introImgName);
                        print(introText);

                        print(introTitle);
                        print(introImgName);
                        print(introText);

                        await DatabaseService(uid: user.uid).addInData(
                            secNum, introTitle, introImgName, introText);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => QuestionAndAnswer()));
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
