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

    return Container(
      color: Color(0xffFBFCFE),
      child: SafeArea(
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100),
            child: AppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              flexibleSpace: Column(
                children: [
                  Container(
                    height: size.height * 0.07,
                    decoration: BoxDecoration(
                      color: themeProvider.themeMode == ThemeMode.light
                          ? Colors.white
                          : TreeVedAppTheme.boxColorDark,
                      border: Border(
                        bottom: BorderSide(
                            width: themeProvider.themeMode == ThemeMode.light
                                ? 1
                                : 1,
                            color: themeProvider.themeMode == ThemeMode.light
                                ? Color(0xffEAEAEA)
                                : TreeVedAppTheme.boxBorderdark),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: themeProvider.themeMode == ThemeMode.light
                              ? Color(0xff0F1A3B4F)
                              : TreeVedAppTheme.boxShadowdark.withOpacity(0.1),
                          blurRadius: 11,
                          spreadRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Discover",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color:
                                    themeProvider.themeMode == ThemeMode.light
                                        ? Colors.black.withOpacity(0.63)
                                        : Colors.white),
                          ),
                          Icon(
                            Icons.search,
                            size: 24,
                            color: themeProvider.themeMode == ThemeMode.light
                                ? Colors.black.withOpacity(0.63)
                                : Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                      // color: Color(0xffFBFCFE),
                      child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
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
                          discovertag(
                            tagTitle: 'Movies',
                            scrollFunction: () {
                              setState(() {
                                selectedTag = "Movies";
                              });
                              Scrollable.ensureVisible(
                                  duration: const Duration(milliseconds: 400),
                                  curve: Curves.easeInOut,
                                  movieKey.currentContext ?? context);
                            },
                          ),
                        ],
                      ),
                    ),
                  )),
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
                    color: const Color.fromARGB(255, 209, 209, 209)
                        .withOpacity(0.1),
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
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400)),
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
                    color: const Color.fromARGB(255, 209, 209, 209)
                        .withOpacity(0.1),
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
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: Row(
                    children: [
                      const Icon(Icons.list),
                      const SizedBox(width: 10.5),
                      Text("Explore Lists",
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w400)),
                      const Spacer(),
                      TextButton(
                          onPressed: () {
                            //
                          },
                          child: const Text("See more")),
                    ],
                  ),
                ),
                SizedBox(
                  height: 288,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 3,
                    itemBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.only(bottom: 8),
                      child: ListTabs(
                        isUserList: false,
                        title: "Economics Resources",
                      ),
                    ),
                  ),
                ),
                categoryTiles(
                  title: 'Articles',
                  addedkey: articleKey,
                ),
                categoryTiles(
                  title: 'Movies',
                  addedkey: movieKey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class categoryTiles extends StatelessWidget {
  final String title;
  final Key addedkey;

  categoryTiles({
    Key? key,
    required this.title,
    required this.addedkey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          key: addedkey,
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Row(
            children: [
              const Icon(Icons.local_movies_outlined),
              const SizedBox(width: 10.5),
              Text(title,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400)),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    //
                  },
                  child: const Text("See more")),
            ],
          ),
        ),
        SizedBox(
          height: 275,
          child: ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) => const Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: SlideLink(),
            ),
          ),
        ),
      ],
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
                color: selectedTag == widget.tagTitle
                    ? Colors.blue
                    : themeProvider.themeMode == ThemeMode.light
                        ? Colors.black.withOpacity(0.63)
                        : TreeVedAppTheme.boxBorderdark,
              ),
              borderRadius: BorderRadius.circular(28),
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
                        : TextStyle(
                            color: themeProvider.themeMode == ThemeMode.light
                                ? Colors.black.withOpacity(0.63)
                                : TreeVedAppTheme.boxBorderdark,
                            fontWeight: FontWeight.w500,
                          ),
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
