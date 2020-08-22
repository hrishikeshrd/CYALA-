import 'package:cyala/Social.dart';
import 'package:cyala/settings.dart';

import 'ChatScreen.dart';
import 'search.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MainScreens extends StatefulWidget {
  @override
  _MainScreensState createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  int currentTabIndex = 0;
  List<Widget> pages;
  Widget currentPage;

  Social social;
  ChatScreen chatScreen;
  SearchScreen searchScreen;
  Settings settings;

  @override
  void initState() {
    super.initState();
    social = Social();
    chatScreen = ChatScreen();
    searchScreen = SearchScreen();
    settings = Settings();

    pages = [social, chatScreen, searchScreen, settings];

    currentPage = social;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.black,
        onTap: (int index) {
          setState(() {
            currentTabIndex = index;
            currentPage = pages[index];
          });
        },
        currentIndex: currentTabIndex,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.googlePodcast,
                color: Colors.white,
              ),
              title: Text(
                "SOCIAL",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                MdiIcons.text,
                color: Colors.white,
              ),
              title: Text(
                "CHATS",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              )),
          BottomNavigationBarItem(
            icon: Icon(
              MdiIcons.accountSearchOutline,
              color: Colors.white,
            ),
            title: Text(
              "FRIENDS",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                color: Colors.white,
              ),
              title: Text(
                "PROFILE",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ))
        ],
      ),
      body: currentPage,
    );
  }
}
