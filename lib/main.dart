
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wholeloginmechanism/splashScreen.dart';
import 'ChoosePage.dart';
import 'CreateAccountPage.dart';
import 'SignInPage.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/' : (context) => Splash_Screen(),
        'createac' : (context) => Create_Account(),
        'signin' : (context) => Sign_In(),
      },
    )
  );
}