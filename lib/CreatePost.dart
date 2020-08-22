import 'dart:io';

import 'package:cyala/Constants.dart';
import 'package:cyala/Terms.dart';
import 'package:cyala/Warning.dart';
import 'package:cyala/crud.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:random_string/random_string.dart';

class CreatePost extends StatefulWidget {
  @override
  _CreatePostState createState() => _CreatePostState();
}

class _CreatePostState extends State<CreatePost> {
  String loaction, desc;
  bool _isLoading = false;
  CrudMethods crudMethods = new CrudMethods();
  final picker = ImagePicker();
  final formkey = GlobalKey<FormState>();
  TextEditingController _locationcontroller = new TextEditingController();
  TextEditingController _caption = new TextEditingController();

  File selectedImage;

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      selectedImage = File(pickedFile.path);
    });
  }

  uploadPost() async {
    if (Constants.myName != "") {
      if (selectedImage != null &&
          _caption.text.isNotEmpty &&
          _locationcontroller.text.isNotEmpty) {
        StorageReference firebaseStorageRef = FirebaseStorage.instance
            .ref()
            .child("postImages")
            .child("${randomAlphaNumeric(9)}.jpg");
        final StorageUploadTask task =
            firebaseStorageRef.putFile(selectedImage);

        var downloadUrl = await (await task.onComplete).ref.getDownloadURL();
        print("this is URL $downloadUrl");
        Map<String, dynamic> postMap = {
          "imageUrl": downloadUrl,
          "authorName": Constants.myName,
          "location": loaction,
          "desc": desc,
          "time": DateTime.now().millisecondsSinceEpoch,
        };

        crudMethods.addData(postMap).then((result) {
          Navigator.pop(context);
        });
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => Warning()));
      }
      setState(() {
        _isLoading = true;
      });
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (BuildContext context) => Warning()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 200,
                  width: 500,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/siri2.gif"),
                    fit: BoxFit.cover,
                  )),
                ),
                SizedBox(
                  height: 0,
                ),
                Text(
                  "CYALA IS PROCESSING YOUR POST",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    fontSize: 18,
                    letterSpacing: 1.5,
                  ),
                ),
                Container()
              ],
            ),
          )
        : Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.black,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "|",
                    style: TextStyle(color: Colors.black),
                  ),
                  Text(
                    "POST      ",
                    style: TextStyle(
                        fontWeight: FontWeight.w300, letterSpacing: 2),
                  ),
                  Icon(MdiIcons.googlePodcast)
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    child: GestureDetector(
                      onTap: () {
                        getImage();
                      },
                      child: selectedImage != null
                          ? Container(
                              height: 230,
                              width: 500,
                              child: Image.file(selectedImage),
                            )
                          : Container(
                              height: 230,
                              width: 500,
                              decoration: BoxDecoration(
                                  color: Colors.white10,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.add_a_photo,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 0.7,
                                    width: 200,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Add a photo",
                                    style: TextStyle(
                                        color: Colors.white, letterSpacing: 1),
                                  )
                                ],
                              ),
                            ),
                    ),
                  ),
                  Text(
                    "CYALA will automatically adapt to image size.",
                    style: TextStyle(color: Colors.white70),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                    child: Form(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "LOCATION",
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 2),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: TextFormField(
                                controller: _locationcontroller,
                                onChanged: (val) {
                                  loaction = val;
                                },
                                validator: (val) {
                                  return _locationcontroller.text.isNotEmpty
                                      ? null
                                      : "Location must be added";
                                },
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "Add Location",
                                  hintStyle: TextStyle(color: Colors.white70),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            "CAPTION",
                            style: TextStyle(
                                color: Colors.white, letterSpacing: 2),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.white10,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                              child: TextFormField(
                                controller: _caption,
                                onChanged: (value) {
                                  desc = value;
                                },
                                validator: (val) {
                                  return _caption.text.isNotEmpty
                                      ? null
                                      : "Tell something what's happening before posting";
                                },
                                maxLines: 5,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "What's happening?",
                                  hintStyle: TextStyle(color: Colors.white70),
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "(Check whether your post does not violate our Terms And Conditions)",
                            style: TextStyle(
                                color: Colors.white,
                                letterSpacing: 1,
                                fontSize: 13),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          TermsConditions()));
                            },
                            child: Container(
                              child: Text(
                                "Terms And Conditions.",
                                style: TextStyle(
                                    color: Colors.blue[300],
                                    fontWeight: FontWeight.w900,
                                    fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Center(
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              backgroundColor: Colors.white12,
              onPressed: () {
                uploadPost();
              },
            ),
          );
  }
}
