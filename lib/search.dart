import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cyala/Constants.dart';
import 'package:cyala/ConversationScreen.dart';
import 'package:cyala/Database.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  DatabaseMethods databaseMethods = new DatabaseMethods();

  TextEditingController searchTextEditingController =
      new TextEditingController();

  QuerySnapshot searchSnapShot;

  Widget searchList() {
    return searchSnapShot != null
        ? ListView.builder(
            itemCount: searchSnapShot.documents.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return searchSnapShot.documents.length != 0
                  ? SearchTile(
                      userName: searchSnapShot.documents[index].data["Name"],
                      userEmail: searchSnapShot.documents[index].data["Email"],
                    )
                  : Container(
                      color: Colors.white,
                      height: 20,
                      child: Center(
                        child: Text(
                          "No Resuts Found",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );
            })
        : SingleChildScrollView(
            child: Container(
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/siri.gif"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: GestureDetector(
                      onTap: () {
                        if (Constants.myName != "") {
                          Share.share(
                              "Hey There,\nMy username is \"${Constants.myName}\"\nAdd me as a friend on CYALA\n https://play.google.com/store/apps/details?id=com.hrishi.cyala");
                        }
                      },
                      child: Container(
                        color: Colors.white10,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                height: 45,
                                child: Center(
                                  child: Text(
                                    "Share your CYALA username to friends.",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        letterSpacing: 0.5),
                                  ),
                                ),
                              ),
                              Icon(
                                Icons.share,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  initiateSearch() {
    databaseMethods
        .getUserByUsername(searchTextEditingController.text)
        .then((val) {
      print(val.toString());
      setState(() {
        searchSnapShot = val;
      });
    });
  }

  createChatroomAndStartConversation({String userName}) {
    print("${Constants.myName}");
    if (userName != Constants.myName) {
      String chatRoomId = getChatRoomId(userName, Constants.myName);
      List<String> users = [userName, Constants.myName];
      Map<String, dynamic> chatRoomMap = {
        "users": users,
        "chatroomId": chatRoomId,
      };

      DatabaseMethods().createChatRoom(chatRoomId, chatRoomMap);
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => ConversationScreen(chatRoomId)));
    } else {
      print("You cant do this");
    }
  }

  Widget SearchTile({String userName, String userEmail}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 2.5, 5, 2.5),
      child: Container(
        color: Colors.white10,
        width: 500,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(13, 0, 13, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    userName,
                    style: TextStyle(color: Colors.white, fontSize: 23),
                  ),
                  Text(
                    userEmail,
                    style: TextStyle(color: Colors.white60, fontSize: 14),
                  )
                ],
              ),
              Spacer(),
              GestureDetector(
                onTap: () {
                  createChatroomAndStartConversation(userName: userName);
                },
                child: Container(
                  height: 35,
                  width: 70,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white24,
                  ),
                  child: Center(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "ADD",
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 16,
                      ),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 60, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "SEARCH YOUR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Text(
                      "FRIENDS.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 40, 10, 40),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white10,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: TextField(
                          controller: searchTextEditingController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Search Username",
                            hintStyle: TextStyle(color: Colors.white70),
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                          ),
                        )),
                        GestureDetector(
                          onTap: () {
                            initiateSearch();
                          },
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "(\"After Clicking on add check your ChatRoom\")",
                  style: TextStyle(
                      color: Colors.white70, fontStyle: FontStyle.italic),
                ),
              ),
              searchList(),
            ],
          ),
        ),
      ),
    );
  }
}

getChatRoomId(String a, String b) {
  if (a.substring(0, 1).codeUnitAt(0) > b.substring(0, 1).codeUnitAt(0)) {
    return "$b\_$a";
  } else {
    return "$a\_$b";
  }
}
