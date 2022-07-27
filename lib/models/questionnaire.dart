import 'package:flutter/material.dart';

class Questionnaire {
  final String audienceName;
  final int numSections;
  final int numQuesPerSec;

  Questionnaire(
      {required this.audienceName,
      required this.numQuesPerSec,
      required this.numSections});
}
