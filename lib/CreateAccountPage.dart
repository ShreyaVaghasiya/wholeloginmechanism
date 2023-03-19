import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wholeloginmechanism/utilPage.dart';

import 'AuthHelper.dart';

class Create_Account extends StatefulWidget {
  const Create_Account({Key? key}) : super(key: key);

  @override
  State<Create_Account> createState() => _Create_AccountState();
}

class _Create_AccountState extends State<Create_Account> {
  final _formKey = GlobalKey<FormState>();


  bool validateStructure(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CupertinoColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            CupertinoIcons.back,
            size: 30,
            color: CupertinoColors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text(
          "Create Account",
          style: GoogleFonts.quicksand(
              fontSize: 18,
              color: CupertinoColors.black,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(padding: EdgeInsets.all(20)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Email",
                    style: GoogleFonts.quicksand(
                        fontSize: 15, color: CupertinoColors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: AppUtil.emilTextController,
                  onChanged: (val) {
                    setState(() {
                      AppUtil.createEmail = val;
                    });
                  },
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please Enter the Email";
                    }
                    if (!RegExp(
                        r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                        .hasMatch(val)) {
                      return "Enter Valid a Email";
                    }
                  },
                  style: GoogleFonts.quicksand(
                      fontSize: 15,
                      color: CupertinoColors.black,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintText: "Enter email",
                      hintStyle: GoogleFonts.quicksand(
                          fontSize: 15, color: Colors.black26),
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Password",
                    style: GoogleFonts.quicksand(
                        fontSize: 15, color: CupertinoColors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(

                  onChanged: (val) {
                    setState(() {
                      AppUtil.createPass = val;
                      validateStructure(AppUtil.createPass);
                    });
                  },
                  controller: AppUtil.passwordTextController,
                  validator: (val) {
                    if (AppUtil.createPass == null ||
                        AppUtil.createPass.isEmpty) {
                      return 'Enter Must be 8 charachters which contain one uppercase,symbol and digit';
                    }
                    if (validateStructure(AppUtil.createPass) == false) {
                      return 'Enter Must be 8 charachters which contain one uppercase,symbol and digit';
                    } else {
                      return null;
                    }
                  },
                  style: GoogleFonts.quicksand(
                      fontSize: 15,
                      color: CupertinoColors.black,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintText: "Enter Password",
                      hintStyle: GoogleFonts.quicksand(
                          fontSize: 15, color: Colors.black26),
                      border: OutlineInputBorder()),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Confirm Password",
                    style: GoogleFonts.quicksand(
                        fontSize: 15, color: CupertinoColors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: AppUtil.cpasswordController,
                  onChanged: (val) {
                    setState(() {
                      AppUtil.confirmPass = val;
                    });
                  },
                  validator: (val) {
                    if (AppUtil.confirmPass == null ||
                        AppUtil.confirmPass.isEmpty) {
                      return "Enter Valid password";
                    }
                    if (AppUtil.confirmPass != AppUtil.confirmPass) {
                      return "Enter Valid password";
                    } else {
                      return null;
                    }
                  },
                  style: GoogleFonts.quicksand(
                      fontSize: 15,
                      color: CupertinoColors.black,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintText: "Enter Confirm Password",
                      hintStyle: GoogleFonts.quicksand(
                          fontSize: 15, color: Colors.black26),
                      border: OutlineInputBorder()),
                ),
              ),
              InkWell(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    Helper.instance.SignUpProcess(context, setState);

                  } else {}
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                  height: h / 15,
                  width: w,
                  decoration: BoxDecoration(
                    color: CupertinoColors.activeOrange,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          color: CupertinoColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}
