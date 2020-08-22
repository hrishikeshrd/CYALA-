import 'package:flutter/material.dart';

class TermsConditions extends StatefulWidget {
  @override
  _TermsConditionsState createState() => _TermsConditionsState();
}

class _TermsConditionsState extends State<TermsConditions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: 500,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  height: 300,
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 200,
                        width: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/CYALA.png")),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "A HrishikeshRD product.",
                        style: TextStyle(color: Colors.white, letterSpacing: 1),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 1,
                        width: 100,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "TERMS OF USE:",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          letterSpacing: 5,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "Basic Terms",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "1. You must be 18 years or older to use this app.\n2. You are responsible for any activity that occurs under your screen name.\n3. You are responsible for keeping your password secure.\n4. You must not abuse, harass, threaten, impersonate or intimidate other CYALA users.\n5. You may not use the CYALA service for any illegal or unauthorized purpose.\n6. You are solely responsible for your conduct and any data, text, information, screen names, graphics, photos, profile post, and display on the CYALA service.\n7. You may not post nude, partially nude, or sexually suggestive photos.\n8. You must not transmit any worms or viruses or any code of a destructive nature.\n9. You must not create or submit unwanted email or comments to any CYALA members.",
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "(Violation of any of these agreements will result in the termination of your CYALA account. While CYALA prohibits such conduct and content on its app, you understand and agree that CYALA cannot be responsible for the Content posted on its app and you nonetheless may be exposed to such materials and that you use the CYALA service at your own risk.)",
                  style: TextStyle(color: Colors.redAccent, fontSize: 18),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "General Conditions",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "1. We reserve the right to modify or terminate the Instagram service for any reason, without notice at any time.\n2.We reserve the right to alter these Terms of Use at any time. If the alterations constitute a material change to the Terms of Use, we will notify you via internet mail according to the preference expressed on your account. What constitutes a material change will be determined at our sole discretion, in good faith and using common sense and reasonable judgement.\n3. We reserve the right to refuse service to anyone for any reason at any time.\n4. We reserve the right to force forfeiture of any username that becomes inactive, violates trademark, or may mislead other users.\n5. We may, but have no obligation to, remove Content and accounts containing Content that we determine in our sole discretion are unlawful, offensive, threatening, libelous, defamatory, obscene or otherwise objectionable or violates any party's intellectual property or these Terms of Use.\n6. We reserve the right to reclaim usernames on behalf of businesses or individuals that hold legal claim or trademark on those usernames.",
                  style: TextStyle(
                      color: Colors.white, fontSize: 17, wordSpacing: 3),
                ),
                SizedBox(
                  height: 40,
                ),
                Text(
                  "\"WELCOME TO THE WORLD OF CYALA\"",
                  style: TextStyle(
                      color: Colors.blue[100], fontSize: 20, letterSpacing: 1),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "~ Hrishikesh Deshmukh",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          letterSpacing: 0.5),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Developer.",
                      style: TextStyle(
                          color: Colors.white, fontSize: 15, letterSpacing: 1),
                    ),
                  ],
                ),
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/CYALA.png"))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
