import 'package:flutter/material.dart';
import 'package:scavanger_hunt/HomePage.dart';
import 'package:scavanger_hunt/Services/auth.dart';
import 'package:scavanger_hunt/authentication/authenticate/authenticate.dart';
import 'package:scavanger_hunt/shared/constants.dart';
import 'package:scavanger_hunt/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({required this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.black,
              elevation: 0.5,
              title: Text('Sign In'),
              actions: <Widget>[
                TextButton.icon(
                    onPressed: () {
                      widget.toggleView();
                    },
                    icon: Icon(Icons.person),
                    label: Text('Register'))
              ],
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
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Email'),
                          validator: (val) =>
                              val!.isEmpty ? 'Enter an Email' : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          }),
                      SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Password'),
                          validator: (val) => val!.length < 6
                              ? 'Enter a Password 6+ chars long'
                              : null,
                          obscureText: true,
                          onChanged: (val) {
                            setState(() => password = val);
                          }),
                      SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.black),
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                loading = true;
                              });
                              dynamic result = await _auth.signInEmailAndPwd(
                                  email, password);
                              print("Heyy");

                              if (result == null) {
                                setState(() {
                                  loading = false;
                                  error = 'Could not sign in with those creds';
                                });
                              } else {
                                setState(() {
                                  loading = false;
                                });

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              }
                            }
                          },
                          child: Text(
                            'Sign In',
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
