import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import '../constants.dart';

class LoginRegister extends StatefulWidget {
  @override
  _LoginRegisterState createState() => _LoginRegisterState();
}

class _LoginRegisterState extends State<LoginRegister> {
  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: App.title,
      onSignup: (data) async {
        try {
          App.auth.createUserWithEmailAndPassword(
            email: data.name, 
            password: data.password,
          ); 
          return null;
          } catch (ex) {
          return ex.toString();
        }
      }, 
      onLogin: (data) async {
        try {
          App.auth.signInWithEmailAndPassword(
            email: data.name, 
            password: data.password
          );
          return null;
        } catch (ex) {
          return ex.toString();
        }
      }, 
      onRecoverPassword: (email) async {
        try {
          App.auth.sendPasswordResetEmail(email: email);
          return null;
        } catch (ex) {
          return ex.toString();
        }
      }
    );
  }
}