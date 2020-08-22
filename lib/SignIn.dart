import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyala/Back.dart';
import 'package:cyala/Database.dart';
import 'package:cyala/ForgotPassword.dart';
import 'package:cyala/MainScreen.dart';
import 'package:cyala/auth.dart';
import 'package:flutter/material.dart';

import 'helperFunction.dart';

class SignIn extends StatefulWidget {
  final Function toggle;
  SignIn(this.toggle);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formkey = GlobalKey<FormState>();
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  TextEditingController emailTextEditingController =
      new TextEditingController();

  TextEditingController passwordTextEditingController =
      new TextEditingController();

  bool isLoading = false;
  QuerySnapshot snapshotUserInfo;

  signIn() {
    if (formkey.currentState.validate()) {
      HelperFunction.saveUserEmailSharedPreference(
          emailTextEditingController.text);

      setState(() {
        isLoading = true;
      });

      databaseMethods
          .getUserByUserEmail(emailTextEditingController.text)
          .then((val) {
        snapshotUserInfo = val;
        HelperFunction.saveUserNameSharedPreference(
            snapshotUserInfo.documents[0].data["Name"]);
      });

      authMethods
          .signInWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((value) {
        if (value != null) {
          HelperFunction.saveUserLoggedInSharedPreference(true);
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => MainScreens()));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Scaffold(
            backgroundColor: Colors.black,
            body: Container(
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      FadeAnimatedTextKit(
                        totalRepeatCount: 1,
                        alignment: Alignment.center,
                        duration: Duration(seconds: 5),
                        pause: Duration(milliseconds: 0),
                        text: ["STARTING CYALA"],
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            letterSpacing: 3,
                            fontWeight: FontWeight.w300),
                        onFinished: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      Backtosign()));
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 90,
                    width: 500,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/siri2.gif"),
                            fit: BoxFit.cover)),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: SingleChildScrollView(
                child: Container(
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "CYALA",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 30,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "SIGN IN",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 10,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                        child: Container(
                          width: 500,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: Colors.black,
                          ),
                          child: Form(
                            key: formkey,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 40, 10, 0),
                                  child: Container(
                                    color: Colors.white10,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: TextFormField(
                                        validator: (val) {
                                          return RegExp(
                                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                                  .hasMatch(val)
                                              ? null
                                              : "Provide a valid Email Address*";
                                        },
                                        controller: emailTextEditingController,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          hintText: "Email",
                                          hintStyle:
                                              TextStyle(color: Colors.white70),
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 15, 10, 20),
                                  child: Container(
                                    color: Colors.white10,
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 0, 10, 0),
                                      child: TextFormField(
                                        obscureText: true,
                                        validator: (val) {
                                          return val.length > 7
                                              ? null
                                              : "Password must be of atleast 8 characters*";
                                        },
                                        controller:
                                            passwordTextEditingController,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          hintText: "Password",
                                          hintStyle:
                                              TextStyle(color: Colors.white70),
                                          focusedBorder: InputBorder.none,
                                          enabledBorder: InputBorder.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 30),
                        child: GestureDetector(
                          onTap: () {
                            signIn();
                          },
                          child: Container(
                            height: 45,
                            width: 380,
                            decoration: BoxDecoration(
                                color: Colors.blue[800],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Center(
                                child: Text(
                              "SIGN IN",
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900),
                            )),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Forgot your login credentials? ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ForgotPwd()));
                            },
                            child: Text(
                              "Get help signing in.",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.blue[100],
                                  fontWeight: FontWeight.w900),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 30, 10, 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              height: 1,
                              width: 150,
                              color: Colors.white70,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "OR",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 1,
                              width: 150,
                              color: Colors.white70,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Don't have an Account?",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 17),
                            ),
                            GestureDetector(
                              onTap: () {
                                widget.toggle();
                              },
                              child: Text(
                                " Sign Up.",
                                style: TextStyle(
                                    color: Colors.blue[100],
                                    fontWeight: FontWeight.w900,
                                    fontSize: 17),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
