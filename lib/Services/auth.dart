import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:scavanger_hunt/Services/database.dart';
import 'package:scavanger_hunt/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create my custom user
  MyUser? _userFromFirebase(User? user) {
    return user != null ? MyUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<MyUser?> get user {
    return _auth.authStateChanges().map(_userFromFirebase);
  }

  //sign in anonymous
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in email and pwd
  Future signInEmailAndPwd(String email, String pwd) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pwd);
      User? user = result.user;
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //register email pwd
  Future registerEmailAndPwd(String email, String pwd) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pwd);
      User? user = result.user;

      //Create a new document using the uid
      await DatabaseService(uid: user!.uid)
          .updateQuestionnaireData('audienceName', 1, 3);
      return _userFromFirebase(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
