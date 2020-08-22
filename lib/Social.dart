import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyala/Constants.dart';
import 'package:cyala/CreatePost.dart';
import 'package:cyala/crud.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Social extends StatefulWidget {
  @override
  _SocialState createState() => _SocialState();
}

class _SocialState extends State<Social> {
  CrudMethods crudMethods = new CrudMethods();

  QuerySnapshot postSnapshot;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();

    crudMethods.getData().then((result) {
      setState(() {
        postSnapshot = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Icon(
              MdiIcons.googlePodcast,
              color: Colors.white,
              size: 30,
            ),
            Text("CYALA",
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 20,
                    fontSize: 25,
                    fontWeight: FontWeight.w300)),
            Icon(
              MdiIcons.googlePodcast,
              color: Colors.black,
            ),
          ],
        ),
      ),
      body: postSnapshot != null
          ? Container(
              width: 500,
              child: ListView.builder(
                controller: _scrollController,
                itemCount: postSnapshot.documents.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return PostTile(
                    imageUrl: postSnapshot.documents[index].data["imageUrl"],
                    location: postSnapshot.documents[index].data["location"],
                    authorName:
                        postSnapshot.documents[index].data["authorName"],
                    description: postSnapshot.documents[index].data["desc"],
                  );
                },
              ),
            )
          : Container(
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      height: 150,
                      width: 250,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/wait.gif"),
                              fit: BoxFit.fitWidth)),
                    ),
                  ),
                ],
              ),
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white10,
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) => CreatePost()));
        },
        child: Center(child: Icon(MdiIcons.feather)),
      ),
    );
  }
}

class PostTile extends StatelessWidget {
  String imageUrl, location, description, authorName;

  PostTile(
      {this.imageUrl,
      this.location,
      @required this.authorName,
      this.description});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: Container(
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          authorName,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                              fontSize: 20),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                            Text(
                              location,
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Image.network(
                imageUrl,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 400,
                    width: 500,
                    child: Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.insert_comment, color: Colors.white),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "COMMENTS",
                            style: TextStyle(color: Colors.white70),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Text(
                            "ADD TO CHATS",
                            style: TextStyle(color: Colors.white70),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(MdiIcons.text, color: Colors.white)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(authorName,
                        style: TextStyle(
                            color: Colors.blue[300],
                            fontWeight: FontWeight.w900,
                            fontSize: 18)),
                    Flexible(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                        child: Container(
                          child: Text(
                            description,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
