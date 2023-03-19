import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wholeloginmechanism/AuthHelper.dart';
import 'package:wholeloginmechanism/utilPage.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({Key? key}) : super(key: key);

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  final _formKey1 = GlobalKey<FormState>();

  bool validateStructure1(String value) {
    String pattern1 =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern1);
    return regExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
          "Sign In",
          style: GoogleFonts.quicksand(
              fontSize: 18,
              color: CupertinoColors.black,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey1,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(padding: EdgeInsets.all(20)),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Enter Email",
                    style: GoogleFonts.quicksand(
                        fontSize: 15, color: CupertinoColors.black),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: AppUtil.emilTextController1,
                  onChanged: (val) {
                    setState(() {
                      AppUtil.email = val;
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
                    return null;
                  },
                  style: GoogleFonts.quicksand(
                      fontSize: 15,
                      color: CupertinoColors.black,
                      fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      hintText: "email",
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
                    "Enter Password",
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
                      AppUtil.pass = val;
                      validateStructure1(AppUtil.pass);
                    });
                  },
                  controller: AppUtil.passwordTextController1,
                  validator: (val) {
                    if (AppUtil.pass == null || AppUtil.pass.isEmpty) {
                      return 'Enter Must be 8 charachters which contain one uppercase,symbo; and digit';
                    }
                    if (validateStructure1(AppUtil.pass) == false) {
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
                      hintText: "password",
                      hintStyle: GoogleFonts.quicksand(
                          fontSize: 15, color: Colors.black26),
                      border: OutlineInputBorder()),
                ),
              ),
              InkWell(
                onTap: () async {
                  if (_formKey1.currentState!.validate()) {
                    Helper.instance.SignInProcess(context, setState);
                    AppUtil.emilTextController1.clear();
                    AppUtil.passwordTextController1.clear();

                  }
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
                      "Sign In",
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          color: CupertinoColors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Log In with",
                style: GoogleFonts.quicksand(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  InkWell(
                    onTap: (){
                      Helper.instance.signInWithGoogle();

                    },
                    child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://pixlok.com/wp-content/uploads/2021/04/Google-Icon-PNG-768x768.jpg'),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/Facebook_Logo_%282019%29.png/1024px-Facebook_Logo_%282019%29.png'),
                  )
                ],
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: CupertinoColors.white,
    );
  }
}
