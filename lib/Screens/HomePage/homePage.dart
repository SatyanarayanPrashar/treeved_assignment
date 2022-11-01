import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Screens/HomePage/Feedpage/FeedScreen.dart';
import 'package:treeved_assignment/Screens/HomePage/diaryPage/diaryPage.dart';
import 'package:treeved_assignment/Screens/HomePage/discoverPages/DiscoverPage.dart';
import 'package:treeved_assignment/Screens/HomePage/notificationPages/notificationScreen.dart';
import 'package:treeved_assignment/Screens/ProfilePages/profilePage.dart';
import 'package:treeved_assignment/package/treevedIcon/treeved_icons_icons.dart';
import '../../Constants/notifiers/themes_providers.dart';

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
    DiaryPage(),
    NotificationScreen(),
    ProfilePage(isUserProfile: true)
  ];

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        unselectedIconTheme: IconThemeData(
          color: themeProvider.themeMode == ThemeMode.light
              ? Colors.black.withOpacity(0.38)
              : Colors.white,
        ),
        unselectedLabelStyle: TextStyle(
          color: themeProvider.themeMode == ThemeMode.light
              ? Colors.black.withOpacity(0.38)
              : Colors.white,
        ),
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(TreevedIcons.feed, size: 19),
            icon: Icon(
              TreevedIcons.feed_unselected,
              size: 17,
            ),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(TreevedIcons.discover, size: 27),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(TreevedIcons.diary),
            label: 'Diary',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none_rounded),
            activeIcon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        unselectedItemColor: themeProvider.themeMode == ThemeMode.light
            ? Colors.black.withOpacity(0.38)
            : Colors.white,
        selectedItemColor: Color(0xff008FE4),
        showUnselectedLabels: true,
        currentIndex: index,
      ),
      body: screens[index],
    );
  }
}
