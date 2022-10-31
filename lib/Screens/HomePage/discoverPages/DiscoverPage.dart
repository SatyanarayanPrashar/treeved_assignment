import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/colors.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/Screens/HomePage/discoverPages/WidgetpeopleScreen.dart';
import 'package:treeved_assignment/commons/listTab.dart';
import 'package:treeved_assignment/commons/slideLink.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

String selectedTag = "People";
final peopleKey = GlobalKey();
final pagesKey = GlobalKey();
final listKey = GlobalKey();
final articleKey = GlobalKey();
final movieKey = GlobalKey();

class _DiscoverPageState extends State<DiscoverPage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(95),
        child: AppBar(
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
          flexibleSpace: Column(
            children: [
              SizedBox(height: 75),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 11, 0, 11),
                child: Container(
                    height: size.height * 0.042,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          discovertag(
                            tagTitle: 'People',
                            scrollFunction: () {
                              setState(() {
                                selectedTag = "People";
                              });
                              Scrollable.ensureVisible(
                                peopleKey.currentContext ?? context,
                                duration: const Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                          ),
                          discovertag(
                            tagTitle: 'Pages',
                            scrollFunction: () {
                              setState(() {
                                selectedTag = "Pages";
                              });
                              Scrollable.ensureVisible(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                  pagesKey.currentContext ?? context);
                            },
                          ),
                          discovertag(
                            tagTitle: 'Lists',
                            scrollFunction: () {
                              setState(() {
                                selectedTag = "Lists";
                              });
                              Scrollable.ensureVisible(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                  listKey.currentContext ?? context);
                            },
                          ),
                          discovertag(
                            tagTitle: 'Articles',
                            scrollFunction: () {
                              setState(() {
                                selectedTag = "Articles";
                              });
                              Scrollable.ensureVisible(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                  articleKey.currentContext ?? context);
                            },
                          ),
                        ],
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 11, left: 11),
              child: Container(
                key: peopleKey,
                color:
                    const Color.fromARGB(255, 209, 209, 209).withOpacity(0.1),
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) => PeopleTabs(
                    name: 'Sam Sharma',
                    about: 'Designer/Animator/Feminist',
                    imageDes: 'assets/girl1.jpg',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              key: pagesKey,
              padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
              child: Row(
                children: [
                  const Icon(Icons.table_chart_outlined),
                  const SizedBox(width: 10),
                  Text("Pages you may like",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        //
                      },
                      child: const Text("See more")),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11),
              child: Container(
                color:
                    const Color.fromARGB(255, 209, 209, 209).withOpacity(0.1),
                height: 240,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) => Pagestabs(
                    name: 'Microanimations',
                    imageDes: 'assets/girl2.jpg',
                    bgimage: 'assets/back1.jpg',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              key: listKey,
              padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
              child: Row(
                children: [
                  const Icon(Icons.list),
                  const SizedBox(width: 20),
                  Text("Explore Lists",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        //
                      },
                      child: const Text("See more")),
                ],
              ),
            ),
            const ListTabs(isUserList: false),
            const ListTabs(isUserList: false),
            const ListTabs(isUserList: false),
            Padding(
              key: articleKey,
              padding: const EdgeInsets.fromLTRB(11, 0, 0, 0),
              child: Row(
                children: [
                  const Icon(Icons.local_movies_outlined),
                  const SizedBox(width: 20),
                  Text("Articles",
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        //
                      },
                      child: const Text("See more")),
                  const SizedBox(width: 11),
                ],
              ),
            ),
            SlideLink(),
            SlideLink(),
            SlideLink(),
          ],
        ),
      ),
      // body: SafeArea(
      //   child: Padding(
      //     padding: const EdgeInsets.fromLTRB(0, 7, 0, 7),
      //     child: DefaultTabController(
      //       length: 4,
      //       child: Column(
      //         children: [
      //           ButtonsTabBar(
      //             backgroundColor: Colors.blue,
      //             unselectedBackgroundColor:
      //                 themeProvider.themeMode == ThemeMode.light
      //                     ? Colors.white
      //                     : TreeVedAppTheme.boxColorDark,
      //             borderWidth: 1,
      //             unselectedBorderColor:
      //                 themeProvider.themeMode == ThemeMode.light
      //                     ? Colors.grey
      //                     : TreeVedAppTheme.boxBorderdark,
      //             borderColor: Colors.blue,
      //             radius: 100,
      //             unselectedLabelStyle: const TextStyle(color: Colors.grey),
      //             labelStyle: const TextStyle(
      //                 color: Colors.white, fontWeight: FontWeight.bold),
      //             tabs: const [
      //               Tab(text: "     People     "),
      //               Tab(text: "     Pages     "),
      //               Tab(text: "     Lists     "),
      //               Tab(text: "     Articles     "),
      //             ],
      //           ),
      //           const Expanded(
      //             child: TabBarView(
      //               children: [
      // PeopleScreen(),
      //                 PagesScreen(),
      //                 ListScreen(),
      //                 Center(
      //                   child: Icon(Icons.local_movies_outlined),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

class discovertag extends StatefulWidget {
  const discovertag(
      {super.key, required this.tagTitle, required this.scrollFunction});
  final String tagTitle;
  final void Function() scrollFunction;

  @override
  State<discovertag> createState() => _discovertagState();
}

class _discovertagState extends State<discovertag> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return SizedBox(
      height: size.height * 0.042,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(7, 0, 4, 0),
        child: InkWell(
          onTap: widget.scrollFunction,
          child: Container(
            decoration: BoxDecoration(
              color: selectedTag == widget.tagTitle
                  ? Colors.blue
                  : themeProvider.themeMode == ThemeMode.light
                      ? Colors.white
                      : TreeVedAppTheme.boxColorDark,
              border: Border.all(
                  color: selectedTag == "" ? Colors.blue : Color(0xffA6BBDE)),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Container(
              width: size.width * 0.27,
              child: Center(
                child: FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    widget.tagTitle,
                    maxLines: 1,
                    style: selectedTag == widget.tagTitle
                        ? TextStyle(color: Colors.white)
                        : TextStyle(color: Color(0xffA6BBDE)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
