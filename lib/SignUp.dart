import 'package:cyala/ChatScreen.dart';
import 'package:cyala/Database.dart';
import 'package:cyala/MainScreen.dart';

import 'package:cyala/auth.dart';
import 'package:cyala/helperFunction.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final Function toggle;
  SignUp(this.toggle);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();

  bool isLoading = false;
  final formkey = GlobalKey<FormState>();

  TextEditingController userNameTextEditingController =
      new TextEditingController();

  TextEditingController emailTextEditingController =
      new TextEditingController();

  TextEditingController passwordTextEditingController =
      new TextEditingController();

  TextEditingController confpasswordTextEditingController =
      new TextEditingController();

  signMeUp() {
    if (formkey.currentState.validate()) {
      Map<String, String> userInfoMap = {
        "Name": userNameTextEditingController.text,
        "Email": emailTextEditingController.text,
      };
      HelperFunction.saveUserEmailSharedPreference(
          emailTextEditingController.text);

      HelperFunction.saveUserNameSharedPreference(
          userNameTextEditingController.text);

      setState(() {
        isLoading = true;
      });

      authMethods
          .signUpWithEmailAndPassword(emailTextEditingController.text,
              passwordTextEditingController.text)
          .then((val) {
        databaseMethods.uploadUserInfo(userInfoMap);

        HelperFunction.saveUserLoggedInSharedPreference(true);
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MainScreens()));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: isLoading
          ? Container(
              color: Colors.black,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "SETTING UP CYALA",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 3,
                        fontWeight: FontWeight.w300),
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
              )),
            )
          : Center(
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
                        "SIGN UP",
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
                                          return val.isEmpty || val.length < 4
                                              ? "Username is too short"
                                              : null;
                                        },
                                        controller:
                                            userNameTextEditingController,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          hintText: "Username",
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
                                      const EdgeInsets.fromLTRB(10, 15, 10, 0),
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
                                          hintText: "Your Email",
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
                                      const EdgeInsets.fromLTRB(10, 15, 10, 0),
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
                                          hintText: "Create new password",
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
                                          return confpasswordTextEditingController
                                                      .text ==
                                                  passwordTextEditingController
                                                      .text
                                              ? null
                                              : "Retype the correct password.";
                                        },
                                        controller:
                                            confpasswordTextEditingController,
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          hintText: "Confirm password",
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
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                        child: GestureDetector(
                          onTap: () {
                            signMeUp();
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
                              "SIGN UP",
                              style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900),
                            )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
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
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "Already have an Account?",
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
                                " Sign In.",
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
