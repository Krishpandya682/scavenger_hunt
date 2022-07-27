import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scavanger_hunt/authentication/authenticate/authenticate.dart';
import 'package:scavanger_hunt/main.dart';
import 'package:scavanger_hunt/models/user.dart';
import 'HomePage.dart';
import 'displayQuestionnaire/displayHomePage.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MyUser?>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}
