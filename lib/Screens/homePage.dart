import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/Feedpage/FeedScreen.dart';
import 'package:treeved_assignment/Screens/diaryPage/diaryPage.dart';
import 'package:treeved_assignment/Screens/discoverPages/DiscoverPage.dart';
import 'package:treeved_assignment/Screens/ProfilePages/profilePage.dart';
import 'package:treeved_assignment/package/treevedIcon/treeved_icons_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  final screens = [
    FeedPage(),
    DiscoverPage(),
    ProfilePage(),
    DiaryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(
              TreevedIcons.feed,
              size: 19,
            ),
            icon: Icon(
              TreevedIcons.feed_unselected,
              size: 17,
            ),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              TreevedIcons.discover,
              size: 27,
            ),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(TreevedIcons.diary),
            label: 'Diary',
          ),
        ],
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        showUnselectedLabels: true,
        currentIndex: index,
      ),
      body: screens[index],
    );
  }
}
