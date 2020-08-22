import 'package:cyala/ChangePWD.dart';
import 'package:cyala/Constants.dart';
import 'package:cyala/MyPosts.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'Terms.dart';
import 'auth.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'authenticate.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    AuthMethods authMethods = new AuthMethods();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            Container(
              height: 230,
              width: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/water.gif"), fit: BoxFit.cover),
              ),
              child: Container(
                height: 230,
                width: 500,
                color: Colors.black26,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10, left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            child: RotateAnimatedTextKit(
                              duration: Duration(milliseconds: 500),
                              pause: Duration(milliseconds: 0),
                              text: ["CAPTURE", "SHARE", "EXPLORE"],
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 10,
                                  fontWeight: FontWeight.w900),
                              totalRepeatCount: 1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Flexible(
                        child: Text(
                          Constants.myName,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.w300,
                              letterSpacing: 1),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 20, 5, 10),
              child: GestureDetector(
                onTap: () async {
                  launch(
                      "https://play.google.com/store/apps/details?id=com.hrishi.cyala");
                },
                child: Container(
                  height: 225,
                  width: 500,
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: Row(
                      children: <Widget>[
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Consider giving us a Good Review.",
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 0.2),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 1,
                        ),
                        Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/CYALA.png"),
                            fit: BoxFit.cover,
                          )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Row(
                children: <Widget>[
                  Text(
                    "INFO AND PREFERENCES",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: GestureDetector(
                onTap: () async {
                  launch("https://twitter.com/CYALA4?s=08");
                },
                child: Container(
                  color: Colors.white10,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.twitter,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Twitter",
                                        style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: GestureDetector(
                          onTap: () async {
                            launch("https://www.instagram.com/cyalaapp/");
                          },
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('assets/in.jpg'),
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Instagram",
                                          style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: GestureDetector(
                          onTap: () async {
                            launch('mailto:hrishikeshdeshmukh22@gmail.com');
                          },
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        MdiIcons.gmail,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Gmail",
                                          style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.vhs,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Version",
                                        style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ),
                              Text(
                                "2020.1.1",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Row(
                children: <Widget>[
                  Text(
                    "DEVELOPER INFO",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: GestureDetector(
                onTap: () async {
                  launch('https://twitter.com/Hrishikeshrd');
                },
                child: Container(
                  color: Colors.white10,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.twitter,
                                      color: Colors.blue,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Twitter",
                                        style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: GestureDetector(
                          onTap: () async {
                            launch('https://www.instagram.com/hrishikeshrd/');
                          },
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('assets/in.jpg'),
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Instagram",
                                          style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: GestureDetector(
                          onTap: () async {
                            launch('https://github.com/hrishikeshrd');
                          },
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        MdiIcons.github,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("GitHub",
                                          style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: GestureDetector(
                          onTap: () async {
                            launch(
                                'https://hrishikeshdeshmukh3.wixsite.com/official');
                          },
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        MdiIcons.webhook,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Personal Website",
                                          style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: GestureDetector(
                          onTap: () async {
                            launch(
                                "https://play.google.com/store/apps/developer?id=HrishikeshRD&hl=en_US");
                          },
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage('assets/pl.png'),
                                            fit: BoxFit.fitWidth,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("PlayStore",
                                          style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: GestureDetector(
                          onTap: () async {
                            launch(
                                'https://www.linkedin.com/in/hrishikeshdeshmukh22/');
                          },
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(
                                        MdiIcons.linkedin,
                                        color: Colors.blue,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("LinkedIn",
                                          style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                )
                              ],
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
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Row(
                children: <Widget>[
                  Text(
                    "DEVELOPER INFO",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: GestureDetector(
                onTap: () async {
                  launch('mailto:hrishikeshdeshmukh22@gmail.com');
                },
                child: Container(
                  color: Colors.white10,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: Container(
                          height: 50,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      MdiIcons.bug,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text("Report Bugs",
                                        style: TextStyle(
                                          fontSize: 19,
                                          color: Colors.white,
                                        ))
                                  ],
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: GestureDetector(
                          onTap: () async {
                            launch('mailto:hrishikeshdeshmukh22@gmail.com');
                          },
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  child: Row(
                                    children: <Widget>[
                                      Icon(MdiIcons.earHearing,
                                          color: Colors.white),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text("Any Suggestions?",
                                          style: TextStyle(
                                            fontSize: 19,
                                            color: Colors.white,
                                          ))
                                    ],
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                )
                              ],
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
              padding: const EdgeInsets.fromLTRB(10, 15, 10, 10),
              child: Row(
                children: <Widget>[
                  Text(
                    "CYALA",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 19,
                        fontWeight: FontWeight.w300,
                        letterSpacing: 1),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MyPosts()));
                },
                child: Container(
                  height: 50,
                  width: 440,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                    color: Colors.white10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              MdiIcons.feather,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'My Posts',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 19),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => ChangePwd()));
                },
                child: Container(
                  height: 50,
                  width: 440,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                    color: Colors.white10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              MdiIcons.key,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Change Password',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 19),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: GestureDetector(
                onTap: () {
                  Share.share(
                      "Download the CYALA App from PlayStore \n https://play.google.com/store/apps/details?id=com.hrishi.cyala");
                },
                child: Container(
                  height: 50,
                  width: 440,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                    color: Colors.white10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.group_add,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Invite Your Friends',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 19),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: GestureDetector(
                onTap: () {
                  if (Constants.myName != "") {
                    Share.share(
                        "Hey There,\nMy username is \"${Constants.myName}\"\nAdd me as a friend on CYALA\n https://play.google.com/store/apps/details?id=com.hrishi.cyala");
                  }
                },
                child: Container(
                  height: 50,
                  width: 440,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                    color: Colors.white10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.share,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Share your Username',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 19),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => TermsConditions()));
                },
                child: Container(
                  height: 50,
                  width: 440,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                    color: Colors.white10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              MdiIcons.alertBoxOutline,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Terms And Conditions',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 19),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
              child: GestureDetector(
                onTap: () {
                  authMethods.signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => Authenticate()));
                },
                child: Container(
                  height: 50,
                  width: 440,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(0),
                      topRight: Radius.circular(0),
                    ),
                    color: Colors.white10,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.exit_to_app,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Log Out',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 19),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Text(
                'Made by Hrishikesh with love in India.',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1,
                  color: Colors.white,
                  fontSize: 15,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
