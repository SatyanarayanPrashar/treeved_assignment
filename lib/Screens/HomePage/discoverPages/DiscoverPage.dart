import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/colors.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/Screens/HomePage/discoverPages/listScreen.dart';
import 'package:treeved_assignment/Screens/HomePage/discoverPages/pagesScreen.dart';
import 'package:treeved_assignment/Screens/HomePage/discoverPages/peopleScreen.dart';

import '../../../package/button_tabbar/buttons_tabbar.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Discover",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              color: themeProvider.themeMode == ThemeMode.light
                  ? Colors.black
                  : Colors.white),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 11),
            child: Icon(
              Icons.search,
              size: 27,
            ),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
          child: DefaultTabController(
            length: 4,
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  backgroundColor: Colors.blue,
                  unselectedBackgroundColor:
                      themeProvider.themeMode == ThemeMode.light
                          ? Colors.white
                          : TreeVedAppTheme.boxColorDark,
                  borderWidth: 1,
                  unselectedBorderColor:
                      themeProvider.themeMode == ThemeMode.light
                          ? Colors.grey
                          : TreeVedAppTheme.boxBorderdark,
                  borderColor: Colors.blue,
                  radius: 100,
                  unselectedLabelStyle: const TextStyle(color: Colors.grey),
                  labelStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  tabs: const [
                    Tab(text: "     People     "),
                    Tab(text: "     Pages     "),
                    Tab(text: "     Lists     "),
                    Tab(text: "     Articles     "),
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
