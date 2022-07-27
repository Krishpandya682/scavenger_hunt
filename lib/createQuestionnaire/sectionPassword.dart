import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scavanger_hunt/createQuestionnaire/createFinishPage.dart';
import 'package:scavanger_hunt/createQuestionnaire/sectionIntro.dart';
import 'package:scavanger_hunt/models/user.dart';
import 'package:scavanger_hunt/shared/constants.dart';
import 'package:scavanger_hunt/Services/database.dart';
import 'package:provider/provider.dart';

import 'numericalValues.dart';

class SectionPassword extends StatefulWidget {
  @override
  _SectionPasswordState createState() => _SectionPasswordState();
}

class _SectionPasswordState extends State<SectionPassword> {
  @override
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  String password = '';

  String error = '';

  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.5,
        title: Text('Password Page ' + secNum.toString()),
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
                        hintText: 'Section ' + secNum.toString() + ' Password'),
                    validator: (val) =>
                        val!.isEmpty ? 'Enter a Password' : null,
                    onChanged: (val) {
                      setState(() => password = val);
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
                        print(password);

                        await DatabaseService(uid: user.uid).addPassword(
                          secNum,
                          password,
                        );

                        if (secNum >= TOTAL_SECTS) {
                          secNum = 1;
                          questNum = 1;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateFinishPage()));
                          return;
                        } else {
                          secNum++;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SectionIntro()));
                        }
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
