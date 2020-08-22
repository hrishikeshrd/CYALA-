import 'package:cyala/SignIn.dart';
import 'package:cyala/authenticate.dart';
import 'package:flutter/material.dart';

class Backtosign extends StatefulWidget {
  @override
  _BacktosignState createState() => _BacktosignState();
}

class _BacktosignState extends State<Backtosign> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/water.gif"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.black38,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("CYALA",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 20)),
              SizedBox(
                height: 70,
              ),
              Text("Check your Internet Connectivity",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      letterSpacing: 2)),
              SizedBox(
                height: 30,
              ),
              Row(
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
              SizedBox(
                height: 30,
              ),
              Text(
                "Try Signing with valid login credentials",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 2),
              ),
              SizedBox(
                height: 70,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => Authenticate()));
                },
                child: Container(
                  height: 40,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                      child: Text(
                    "SIGN IN AGAIN",
                    style: TextStyle(color: Colors.white),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
