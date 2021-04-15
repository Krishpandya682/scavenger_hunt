import 'package:flutter/cupertino.dart';

class QnA {
  Widget extraWidget;
  String question;
  String answer;

  QnA({this.extraWidget, this.question, this.answer});

  static List<QnA> getQuestions() {
    return [
      new QnA(
          extraWidget: getImageWidget('img.jpg'),
          question: "Question 1",
          answer: "Answer 1"),
      new QnA(
          extraWidget: getImageWidget('img.jpg'),
          question: "Question 2",
          answer: "Answer 2"),
      new QnA(
          extraWidget: getImageWidget('img.jpg'),
          question: "Question 3",
          answer: "Answer 3"),
      new QnA(
          extraWidget: getImageWidget('img.jpg'),
          question: "Question 4",
          answer: "Answer 4"),
      new QnA(
          extraWidget: getImageWidget('img.jpg'),
          question: "Question 5",
          answer: "Answer 5"),
      new QnA(
          extraWidget: getImageWidget('img.jpg'),
          question: "Question 6",
          answer: "Answer 6"),
      new QnA(
          extraWidget: getImageWidget('img.jpg'),
          question: "Question 7",
          answer: "Answer 7"),
      new QnA(
          extraWidget: getImageWidget('img.jpg'),
          question: "Question 8",
          answer: "Answer 8"),
      new QnA(
          extraWidget: getImageWidget('img.jpg'),
          question: "Question 9",
          answer: "Answer 9"),
      new QnA(
          extraWidget: getImageWidget('img.jpg'),
          question: "Question 10",
          answer: "Answer 10"),
      new QnA(
          extraWidget: getImageWidget('img.jpg'),
          question: "Question 11",
          answer: "Answer 11"),
      new QnA(
          extraWidget: getImageWidget('img.jpg'),
          question: "Question 12",
          answer: "Answer 12"),
    ];
  }

  static List<int> getPasswords() {
    return [1111, 2222, 3333, 4444];
  }

  static Widget getImageWidget(String filename) {
    return Image.asset('assets/img/$filename');
  }

  static List<String> getTitles() {
    return ["Title1", "Title2", "Title3", "Title4"];
  }
}
