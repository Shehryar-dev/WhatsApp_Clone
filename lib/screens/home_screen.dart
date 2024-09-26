import 'package:flutter/material.dart';
import 'tabs/calls_tab.dart';
import 'tabs/camera_tab.dart';
import 'tabs/chat_tab.dart';
import 'tabs/status_tab.dart';

class home_screen extends StatefulWidget {
  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        initialIndex: 1,
        child: Scaffold(
          appBar: AppBar(
            bottomOpacity: 0.7,
            backgroundColor: const Color(0xff005B54),
            title: const Text(
              "WhatsApp",
              style: TextStyle(
                  fontFamily: "Helvetica-bold",
                  fontSize: 24,
                  fontWeight: FontWeight.normal,
                  color: Colors.white),
            ),
            bottom: const TabBar(
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                dividerColor: Colors.white,
                tabs: [
                  Tab(
                      icon: Icon(Icons.camera_alt,
                          color: Colors.white, size: 27)),
                  Tab(
                      child: Text(
                    "Chats",
                    style: TextStyle(
                        fontFamily: "Helvetica-reg",
                        color: Colors.white,
                        fontSize: 17),
                  )),
                  Tab(
                      child: Text("Status",
                          style: TextStyle(
                              fontFamily: "Helvetica-reg",
                              color: Colors.white,
                              fontSize: 17))),
                  Tab(
                      child: Text("Calls",
                          style: TextStyle(
                              fontFamily: "Helvetica-reg",
                              color: Colors.white,
                              fontSize: 17)))
                ]),
            centerTitle: false,
            actions: [
              const Icon(Icons.search, color: Colors.white, size: 25),
              const SizedBox(
                width: 8,
              ),
              PopupMenuButton(
                position: PopupMenuPosition.under,
                color:const Color(0xffFBF9F9),
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 25,
                  ),
                  itemBuilder: (context) => const [
                        PopupMenuItem(value: "1", child: Text("New group")),
                        PopupMenuItem(value: "2", child: Text("New broadcast")),
                        PopupMenuItem(value: "3", child: Text("Linked device")),
                        PopupMenuItem(
                            value: "4", child: Text("Starred message")),
                        PopupMenuItem(value: "5", child: Text("Setting")),
                      ]),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
          backgroundColor: const Color(0xffFBF9F9),
          body:const TabBarView(children: [
            /// ----camera-tab
             camera_tab(),
            /// ----chat-tab
             chat_tab(),
            /// ----Status-tab
             status_tab(),
            ///------Call-tab
             calls_tab(),
          ]),
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 6),
            child: FloatingActionButton(
              onPressed: () {},
              shape: const CircleBorder(),
              backgroundColor: const Color(0xff128c7e),
              child: const TabBarView(children: [
                Icon(color: Color(0xffFFFFFF), Icons.camera),
                Icon(
                  Icons.message,
                  color: Color(0xffFFFFFF),
                ),
                Icon(
                  Icons.camera_alt,
                  color: Color(0xffFFFFFF),
                ),
                Icon(
                  Icons.call,
                  color: Color(0xffFFFFFF),
                ),
              ]),
            ),
          ),
        ));
  }
}
