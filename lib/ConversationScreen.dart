import 'dart:async';

import 'package:cyala/Constants.dart';
import 'package:cyala/Database.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ConversationScreen extends StatefulWidget {
  final String chatRoomId;
  ConversationScreen(this.chatRoomId);
  @override
  _ConversationScreenState createState() => _ConversationScreenState();
}

class _ConversationScreenState extends State<ConversationScreen> {
  DatabaseMethods databaseMethods = new DatabaseMethods();
  ScrollController _scrollController = new ScrollController();
  var i = 1;
  TextEditingController messageController = new TextEditingController();

  Stream chatMessageStream;
  Widget ChatMessageList() {
    return StreamBuilder(
      stream: chatMessageStream,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
                controller: _scrollController,
                itemCount: snapshot.data.documents.length,
                itemBuilder: (context, index) {
                  return MessageTile(
                      snapshot.data.documents[index].data["message"],
                      snapshot.data.documents[index].data["sendBY"] ==
                          Constants.myName);
                })
            : Container();
      },
    );
  }

  sendMessage() {
    if (messageController.text.isNotEmpty) {
      Map<String, dynamic> messageMap = {
        "message": messageController.text,
        "sendBY": Constants.myName,
        "time": DateTime.now().millisecondsSinceEpoch
      };
      databaseMethods.addConversationMessages(widget.chatRoomId, messageMap);
      messageController.text = "";
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }
  }

  @override
  void initState() {
    databaseMethods.getConversationMessages(widget.chatRoomId).then((val) {
      setState(() {
        chatMessageStream = val;
      });
    });
    super.initState();
    Timer.periodic(Duration(milliseconds: 100), (timer) {
      if (mounted) {
        if (i == 1) {
          _scrollToBottom();
          i = 2;
        }
      } else {
        timer.cancel();
      }
    });
  }

  _scrollToBottom() {
    _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black12,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "CYALA",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 5,
                    fontSize: 24),
              ),
            ],
          ),
        ),
        body: Container(
          child: Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 60),
                child: ChatMessageList(),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Container(
                    color: Colors.white10,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 5, 0),
                          child: TextField(
                            textCapitalization: TextCapitalization.sentences,
                            controller: messageController,
                            style: TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              hintText: "Message...",
                              hintStyle: TextStyle(color: Colors.white70),
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                            ),
                          ),
                        )),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                          child: GestureDetector(
                            onTap: () {
                              sendMessage();
                            },
                            child: Icon(
                              MdiIcons.send,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  final String message;
  final bool isSendByMe;

  MessageTile(this.message, this.isSendByMe);
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isSendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Padding(
        padding: isSendByMe
            ? const EdgeInsets.fromLTRB(100, 3, 5, 3)
            : const EdgeInsets.fromLTRB(5, 3, 100, 3),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: isSendByMe
                  ? BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    )
                  : BorderRadius.only(
                      bottomRight: Radius.circular(25),
                      bottomLeft: Radius.circular(0),
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25)),
              gradient: isSendByMe
                  ? LinearGradient(
                      colors: [Colors.blueAccent, Colors.purpleAccent])
                  : LinearGradient(colors: [Colors.white10, Colors.white30])),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Text(
              message,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5),
            ),
          ),
        ),
      ),
    );
  }
}
