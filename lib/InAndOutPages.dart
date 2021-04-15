import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InPages {
  String title;
  String imgName;
  String text;

  InPages({this.text, this.imgName, this.title});

  static List<InPages> getInPages() {
    return [
      new InPages(title: "Title1", imgName: "img.jpg", text: "Text1"),
      new InPages(title: "Title2", imgName: "img.jpg", text: "Text2"),
      new InPages(title: "Title3", imgName: "img.jpg", text: "Text3"),
      new InPages(title: "Title4", imgName: "img.jpg", text: "Text4"),
    ];
  }
}

class OutPages {
  String title;
  Widget widget;
  String text;

  OutPages({this.text, this.widget, this.title});

  static List<OutPages> getOutPages() {
    return [
      new OutPages(title: "Title1", widget: Container(), text: "Text1"),
      new OutPages(title: "Title2", widget: Container(), text: "Text2"),
      new OutPages(title: "Title3", widget: Container(), text: "Text3"),
      new OutPages(title: "Title4", widget: Container(), text: "Text4"),
    ];
  }

  static Widget getVideoPlayerWidget(String url) {
    return Container(
      child: RichText(
        text: TextSpan(
            style: TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              fontFamily: 'PlayFair',
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
              fontSize: 20.0,
              letterSpacing: 2,
            ),
            text: "Click this",
            recognizer: TapGestureRecognizer()
              ..onTap = () async {
                print("url:-");
                print(url);
                if (await canLaunch(url)) {
                  await launch(url, forceWebView: true);
                } else {
                  throw "Cannot Load URL + $url";
                }
              }),
      ),
    );
  }
}
