import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AppUtil{
  static String createEmail = "";
  static String createPass = "";
  static String confirmPass = "";
  static String email = "";
  static String pass = "";
  static bool isValidEmail = false;
  static User? user;
  static bool signIn = false;
  static bool signUp = false;
  static List dataList = [];
  static TextEditingController passwordTextController1 = TextEditingController();
  static TextEditingController emilTextController1 = TextEditingController();
  static TextEditingController passwordTextController = TextEditingController();
  static TextEditingController emilTextController = TextEditingController();
  static TextEditingController cpasswordController = TextEditingController();

}