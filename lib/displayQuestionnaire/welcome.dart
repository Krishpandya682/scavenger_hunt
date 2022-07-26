import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:scavanger_hunt/Services/database.dart';
import 'package:scavanger_hunt/models/questionnaire.dart';

class Welcome {
  Widget welcomePage(context, name) {
    return Container(
      child: Text(
        "Hi $name\n\n Welcome To the Scavenger Hunt, \n\nYou will now receive a series of clues..the answers to which will lead you to passwords that will help you move forward... \n\nHave Fun!!",
        style: Theme.of(context).textTheme.bodyText1,
        textAlign: TextAlign.center,
      ),
    );
  }
}
