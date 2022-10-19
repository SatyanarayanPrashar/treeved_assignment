import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/HomePage/discoverPages/WidgetpeopleScreen.dart';
import 'package:treeved_assignment/Screens/groupPages/chatScreen.dart';
import 'package:treeved_assignment/Screens/groupPages/groupScreen.dart';
import 'package:treeved_assignment/package/treevedIcon/treeved_icons_icons.dart';

class channelScreen extends StatelessWidget {
  const channelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 2,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
            backgroundColor: Colors.white,
            title: Text(
              "Group",
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    //
                  },
                  icon: Icon(TreevedIcons.discover)),
              IconButton(
                  onPressed: () {
                    //
                  },
                  icon: Icon(Icons.more_vert))
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return channelChatScreen();
              }));
            },
            child: Icon(Icons.chat_bubble_outline_rounded),
          ),
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(11),
                child: Container(
                  padding: EdgeInsets.all(11),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(color: Color(0xffEAEAEA)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(255, 223, 223, 223),
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
                        child: Text(
                          "Channel Description",
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.6),
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(7),
                        child: ExpandableText(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu sed ipsum nunc a id dictumst dolor a quis suspendisse Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu sed ipsum nunc a id dictumst dolor a quis suspendisse Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu sed ipsum nunc a id dictumst dolor a quis suspendisse",
                          expandText: "show more",
                          collapseText: "show less",
                          maxLines: 3,
                          linkColor: Colors.grey,
                          linkStyle:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ExploreListTabs();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
