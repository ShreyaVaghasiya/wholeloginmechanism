import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wholeloginmechanism/ChoosePage.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  State<Splash_Screen> createState() => _Splash_ScreenState();
}

class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) => Choose_Page()
            )
        )
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Image(
            image: AssetImage(
                'assets/myimages/3d-account-login-password-form_165488-4522.png'
            ),
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }
}
