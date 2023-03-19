import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Choose_Page extends StatefulWidget {
  const Choose_Page({Key? key}) : super(key: key);

  @override
  State<Choose_Page> createState() => _Choose_PageState();
}

class _Choose_PageState extends State<Choose_Page> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(

        children: [
          Padding(padding: EdgeInsets.all(90)),
          CircleAvatar(
            radius: 90,
            backgroundImage: AssetImage(
              'assets/myimages/3d-account-login-password-form_165488-4522.png'
            ),
          ),
          Padding(padding: EdgeInsets.all(150)),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed('createac');
            },
            child: Container(
              margin: EdgeInsets.all(20),
              height: h / 15,
              width: w,
              decoration: BoxDecoration(
                color: CupertinoColors.activeOrange,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  "Don't have an account?",
                  style: GoogleFonts.lato(
                      fontSize: 22,
                      color: CupertinoColors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.of(context).pushNamed('signin');
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 5),
              height: h / 15,
              width: w,
              decoration: BoxDecoration(
                border: Border.all(color: CupertinoColors.activeOrange, width: 2),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  "Sign In",
                  style: GoogleFonts.lato(
                      fontSize: 22,
                      color: CupertinoColors.activeOrange,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
