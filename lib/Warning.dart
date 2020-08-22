import 'package:flutter/material.dart';

class Warning extends StatefulWidget {
  @override
  _WarningState createState() => _WarningState();
}

class _WarningState extends State<Warning> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/water.gif"), fit: BoxFit.cover)),
        child: Scaffold(
          backgroundColor: Colors.black45,
          body: Container(
            width: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "CYALA",
                  style: TextStyle(
                      color: Colors.white,
                      letterSpacing: 20,
                      fontSize: 50,
                      fontWeight: FontWeight.w200),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: Text(
                    "CYALA cannot publish your Social post request, it is mandatory to add Location and Caption according to CYALA terms and conditions.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                SizedBox(
                  height: 0,
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
                  child: Text(
                    "Please check your internet connection!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 2,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 1,
                  width: 170,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
