import 'package:cyala/SignUp.dart';
import 'package:cyala/auth.dart';
import 'package:cyala/authenticate.dart';
import 'package:flutter/material.dart';

class ForgotPwd extends StatefulWidget {
  @override
  _ForgotPwdState createState() => _ForgotPwdState();
}

class _ForgotPwdState extends State<ForgotPwd> {
  @override
  Widget build(BuildContext context) {
    AuthMethods authMethods = new AuthMethods();
    TextEditingController forgotEmail = new TextEditingController();
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/water.gif"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.black45,
        body: Container(
          height: 1000,
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
                    fontWeight: FontWeight.w200,
                    letterSpacing: 30),
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "FORGOT LOGIN CREDENTIALS?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Text(
                  "Dont Worry! We got your back. Enter your Email Address linked to your Account.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Container(
                  color: Colors.white10,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextFormField(
                      controller: forgotEmail,
                      validator: (val) {
                        return RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(val)
                            ? null
                            : "Provide a valid Email Address*";
                      },
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(color: Colors.white70),
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  authMethods.resetPass(forgotEmail.text);
                  Navigator.of(context).pop(MaterialPageRoute(
                      builder: (BuildContext context) => Authenticate()));
                },
                child: Container(
                  height: 35,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white30,
                      borderRadius: BorderRadius.all(Radius.circular(5))),
                  child: Center(
                    child: Text(
                      "NEXT",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "(Check Your Mail)",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w300),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
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
                          color: Colors.white, fontWeight: FontWeight.w400),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Create a new Account. ",
                    style: TextStyle(color: Colors.white, fontSize: 17),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (BuildContext context) => Authenticate()));
                    },
                    child: Container(
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 17,
                            fontWeight: FontWeight.w900),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
