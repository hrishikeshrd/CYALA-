import 'package:cyala/Constants.dart';
import 'package:cyala/Database.dart';
import 'package:cyala/MainScreen.dart';
import 'package:cyala/auth.dart';
import 'package:cyala/helperFunction.dart';
import 'package:cyala/search.dart';
import 'package:flutter/material.dart';
import 'ConversationScreen.dart';
import 'helperFunction.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  AuthMethods authMethods = new AuthMethods();
  DatabaseMethods databaseMethods = new DatabaseMethods();
  Stream chatRoomsStream;
  Widget chatRoomList() {
    return StreamBuilder(
      stream: chatRoomsStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? snapshot.data.documents.length != 0
                ? ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      return ChatRoomTile(
                          snapshot.data.documents[index].data["chatroomId"]
                              .toString()
                              .replaceAll("_", "")
                              .replaceAll(Constants.myName, ""),
                          snapshot.data.documents[index].data["chatroomId"]);
                    },
                  )
                : Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) => SearchScreen()));
                      },
                      child: Container(
                          height: 48,
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "ADD YOUR ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                "Friends!",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 50,
                                    fontWeight: FontWeight.w100),
                              ),
                            ],
                          ))),
                    ),
                  )
            : Container(
                width: 500,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: 150,
                      width: 250,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/wait.gif"),
                              fit: BoxFit.cover)),
                    ),
                  ],
                )),
              );
      },
    );
  }

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  getUserInfo() async {
    Constants.myName = await HelperFunction.getUserNameSharedPreference();
    databaseMethods.getChatRooms(Constants.myName).then((val) {
      setState(() {
        chatRoomsStream = val;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.all(0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Icon(
                MdiIcons.text,
                color: Colors.white,
                size: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (BuildContext context) => MainScreens()));
                },
                child: Text("CYALA",
                    style: TextStyle(
                        color: Colors.white,
                        letterSpacing: 20,
                        fontSize: 25,
                        fontWeight: FontWeight.w300)),
              ),
              Icon(
                MdiIcons.text,
                color: Colors.black,
                size: 30,
              ),
            ],
          ),
        ),
      ),
      body: chatRoomList(),
    );
  }
}

class ChatRoomTile extends StatelessWidget {
  final String userName;
  final String chatRoomId;
  ChatRoomTile(this.userName, this.chatRoomId);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (BuildContext context) =>
                  ConversationScreen(chatRoomId)));
        },
        child: Container(
          height: 70,
          width: 500,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              gradient:
                  LinearGradient(colors: [Colors.white10, Colors.white12])),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      gradient: LinearGradient(
                          colors: [Colors.purpleAccent, Colors.blueAccent])),
                  child: Center(
                    child: Text(
                      "${userName.substring(0, 1).toUpperCase()}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 25),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 20, 0),
                child: Text(userName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
