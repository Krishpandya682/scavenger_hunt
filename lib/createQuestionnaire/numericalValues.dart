import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:scavanger_hunt/createQuestionnaire/sectionIntro.dart';
import 'package:scavanger_hunt/models/user.dart';
import 'package:scavanger_hunt/shared/constants.dart';
import 'package:scavanger_hunt/Services/database.dart';
import 'package:provider/provider.dart';

int secNum = -1;
int questNum = -1;
int TOTAL_SECTS = -1;
int QUESTS_PER_SECT = -1;

class NumericalValues extends StatefulWidget {
  @override
  _NumericalValuesState createState() => _NumericalValuesState();
}

class _NumericalValuesState extends State<NumericalValues> {
  @override
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  String audienceName = '';
  int numSections = 0;
  int numQuesPerSec = 0;
  String error = '';

  Widget build(BuildContext context) {
    final user = Provider.of<MyUser>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.5,
        title: Text('Enter Questionnaire Data'),
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
                        hintText: 'Name Of The Audience'),
                    validator: (val) => val!.isEmpty ? 'Enter a Name' : null,
                    onChanged: (val) {
                      setState(() => audienceName = val);
                    }),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Number Of Sections'),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter a value";
                    } else if (int.tryParse(val)! < 0 ||
                        int.tryParse(val)! > 5) {
                      return 'Enter a number greater than 0 and less than 5';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    setState(() => numSections = int.tryParse(val)!);
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  decoration: textInputDecoration.copyWith(
                      hintText: 'Number Of Questions per Section'),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter a value";
                    } else if (int.tryParse(val)! < 0 ||
                        int.tryParse(val)! > 5) {
                      return 'Enter a number greater than 0 and less than 5';
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val) {
                    setState(() => numQuesPerSec = int.tryParse(val)!);
                  },
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
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
                        print(audienceName);
                        print(numSections);
                        print(numQuesPerSec);
                        TOTAL_SECTS = numSections;
                        QUESTS_PER_SECT = numQuesPerSec;
                        await DatabaseService(uid: user.uid)
                            .updateQuestionnaireData(
                                audienceName, numSections, numQuesPerSec);

                        secNum = 1;
                        questNum = 1;
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SectionIntro()));
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
