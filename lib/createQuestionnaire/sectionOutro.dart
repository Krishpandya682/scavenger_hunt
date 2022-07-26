import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scavanger_hunt/createQuestionnaire/sectionPassword.dart';
import 'package:scavanger_hunt/models/user.dart';
import 'package:scavanger_hunt/shared/constants.dart';
import 'package:scavanger_hunt/Services/database.dart';
import 'package:provider/provider.dart';

import 'numericalValues.dart';

class SectionOutro extends StatefulWidget {
  @override
  _SectionOutroState createState() => _SectionOutroState();
}

class _SectionOutroState extends State<SectionOutro> {
  @override
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String outroTitle = '';
  String outroImgName = '';
  String outroText = '';

  String error = '';

  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.5,
        title: Text('Outro Page ' + secNum.toString()),
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
                        hintText: 'Outro ' + secNum.toString() + ' Title'),
                    validator: (val) => val.isEmpty ? 'Enter a title' : null,
                    onChanged: (val) {
                      setState(() => outroTitle = val);
                    }),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Outro ' + secNum.toString() + ' Image'),
                    validator: (val) => val.isEmpty ? 'Enter an Img' : null,
                    onChanged: (val) {
                      setState(() => outroImgName = val);
                    }),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                    decoration: textInputDecoration.copyWith(
                        hintText: 'Outro ' + secNum.toString() + ' Text'),
                    validator: (val) => val.isEmpty ? 'Enter some text' : null,
                    onChanged: (val) {
                      setState(() => outroText = val);
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
                        print(outroTitle);
                        print(outroImgName);
                        print(outroText);

                        print(outroTitle);
                        print(outroImgName);
                        print(outroText);

                        await DatabaseService(uid: user.uid).addOutData(
                          secNum,
                          outroTitle,
                          outroImgName,
                          outroText,
                        );

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SectionPassword()));
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
