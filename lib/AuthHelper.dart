import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:wholeloginmechanism/utilPage.dart';

class Helper {
  static Helper instance = Helper();

  SignInProcess(context, setState) async {
    try {
      setState(() {
        AppUtil.signIn = true;
      });

      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: AppUtil.emilTextController1.text,
        password: AppUtil.passwordTextController1.text,
      );

      AppUtil.user = credential.user;

      setState(() {
        AppUtil.signIn = false;
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        AppUtil.signIn = false;
      });

      if (e.code == 'user-not-found') {
        print('User Not Exist');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User Not Exist"),
          ),
        );
      } else if (e.code == 'wrong-password') {
        print('Password Not Valid');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Password Not Valid"),
          ),
        );
      }
    }
  }

  SignUpProcess(context, setState) async {
    try {
      setState(() {
        AppUtil.signUp = true;
      });

      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: AppUtil.emilTextController.text,
        password: AppUtil.passwordTextController.text,
      );

      AppUtil.user = credential.user;
      print("Register User : ${AppUtil.user}");

      setState(() {
        AppUtil.signUp = false;
      });

    } on FirebaseAuthException catch (e) {
      setState(() {
        AppUtil.signUp = false;
      });
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("User already Exist"),
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }
  Future<UserCredential> signInWithGoogle() async {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }

}
