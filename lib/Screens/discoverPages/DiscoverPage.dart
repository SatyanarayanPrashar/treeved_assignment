import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/discoverPages/listScreen.dart';
import 'package:treeved_assignment/Screens/discoverPages/pagesScreen.dart';
import 'package:treeved_assignment/Screens/discoverPages/peopleScreen.dart';

import '../../package/button_tabbar/buttons_tabbar.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 3,
        backgroundColor: Colors.white,
        title: const Text(
          "Discover",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 11),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 27,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
          child: DefaultTabController(
            length: 5,
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  backgroundColor: Colors.blue,
                  unselectedBackgroundColor: Colors.white,
                  borderWidth: 1,
                  unselectedBorderColor: Colors.grey,
                  borderColor: Colors.blue,
                  radius: 100,
                  unselectedLabelStyle: const TextStyle(color: Colors.grey),
                  labelStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  tabs: const [
                    Tab(text: "     People     "),
                    Tab(text: "     Pages     "),
                    Tab(text: "     Lists     "),
                    Tab(text: "     Movies     "),
                    Tab(text: "     Book     "),
                  ],
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      PeopleScreen(),
                      PagesScreen(),
                      ListScreen(),
                      Center(
                        child: Icon(Icons.local_movies_outlined),
                      ),
                      Center(
                        child: Icon(Icons.book_sharp),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
