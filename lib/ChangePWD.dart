import 'package:flutter/material.dart';

import 'auth.dart';

class ChangePwd extends StatefulWidget {
  @override
  _ChangePwdState createState() => _ChangePwdState();
}

class _ChangePwdState extends State<ChangePwd> {
  AuthMethods authMethods = new AuthMethods();
  TextEditingController _change = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: 500,
        height: 1000,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "CHANGE PASSWORD",
              style: TextStyle(
                  color: Colors.white,
                  letterSpacing: 5,
                  fontWeight: FontWeight.w200,
                  fontSize: 30),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Text(
                "Frequently keep changing your password to prevent your account from being hacked.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    letterSpacing: 2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 40),
              child: Container(
                color: Colors.white10,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                    controller: _change,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Confirm your email",
                      hintStyle: TextStyle(color: Colors.white70),
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                authMethods.resetPass(_change.text);
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                color: Colors.white10,
                width: 200,
                child: Center(
                  child: Text(
                    "NEXT",
                    style: TextStyle(color: Colors.white, letterSpacing: 2),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "(Check Your Mail)",
              style: TextStyle(color: Colors.white70),
            )
          ],
        ),
      ),
    );
  }
}
