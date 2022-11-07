import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/colors.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/Screens/HomePage/Feedpage/FeedScreen.dart';
import 'package:treeved_assignment/Screens/HomePage/diaryPage/diaryPage.dart';
import 'package:treeved_assignment/Screens/ListPages/addLink.dart';
import 'package:treeved_assignment/Screens/ListPages/createList.dart';
import 'package:treeved_assignment/commons/feedIcon.dart';
import 'package:treeved_assignment/commons/slideLink.dart';
import 'package:treeved_assignment/package/treevedIcon/treeved_icons_icons.dart';

class listScreen extends StatefulWidget {
  const listScreen(
      {super.key,
      required this.listName,
      required this.listlength,
      this.description,
      this.tags,
      required this.createdBy});

  final String listName;
  final String listlength;
  final String? description;
  final String? tags;
  final String createdBy;
  final bool? isGridview = false;

  @override
  State<listScreen> createState() => _listScreenState();
}

class _listScreenState extends State<listScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.listName,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: themeProvider.themeMode == ThemeMode.light
                ? Colors.black.withOpacity(0.63)
                : Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                isGridView = !isGridView;
              });
            },
            icon: isGridView
                ? Icon(
                    Icons.menu_outlined,
                    color: themeProvider.themeMode == ThemeMode.light
                        ? Colors.black.withOpacity(0.63)
                        : Colors.white,
                  )
                : Icon(
                    Icons.grid_view,
                    color: themeProvider.themeMode == ThemeMode.light
                        ? Colors.black.withOpacity(0.63)
                        : Colors.white,
                  ),
          ),
          IconButton(
            onPressed: () {
              //
            },
            icon: Icon(TreevedIcons.discover),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return addLink();
          }));
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(11),
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: themeProvider.themeMode == ThemeMode.light
                  ? Colors.white
                  : TreeVedAppTheme.boxColorDark,
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                  color: themeProvider.themeMode == ThemeMode.light
                      ? Color(0xffEAEAEA)
                      : TreeVedAppTheme.boxBorderdark),
              boxShadow: [
                BoxShadow(
                  color: themeProvider.themeMode == ThemeMode.light
                      ? Color.fromARGB(255, 223, 223, 223)
                      : Colors.white.withOpacity(0.3),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                            color: themeProvider.themeMode == ThemeMode.light
                                ? Colors.black.withOpacity(0.6)
                                : Colors.grey,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(7, 2, 7, 2),
                        decoration: BoxDecoration(
                          color: Color(0xffEFF3FB),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.link,
                              size: 20,
                              color: Color(0xff658AC7),
                            ),
                            Text(
                              " " + widget.listlength,
                              style: TextStyle(
                                color: Color(0xff658AC7),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(7),
                  child: ExpandableText(
                    widget.description ??
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu sed ipsum nunc a id dictumst dolor a quis suspendisse Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu sed ipsum nunc a id dictumst dolor a quis suspendisse Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu sed ipsum nunc a id dictumst dolor a quis suspendisse",
                    style: TextStyle(
                      color: themeProvider.themeMode == ThemeMode.light
                          ? Colors.black.withOpacity(0.63)
                          : Colors.white,
                    ),
                    expandText: "show more",
                    collapseText: "show less",
                    maxLines: 2,
                    linkColor: Colors.grey,
                    linkStyle: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
                Container(
                  height: 30,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(17, 7, 17, 7),
                        decoration: BoxDecoration(
                          color: Color(0xffEFF3FB),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Text(
                          "Management",
                          style: TextStyle(
                            color: Color(0xff658AC7),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 7),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 3,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.folder_outlined,
                                  color: Colors.blue,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 7),
                                  child: Text(
                                    "Must watch movies",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 11,
                                    backgroundImage:
                                        AssetImage("assets/boy1.png"),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 7),
                                    child: Text(
                                      widget.createdBy,
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.6),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 14, right: 7),
                        child: FeedIcons(
                          label: "23",
                          icon: Icons.bookmark_border_rounded,
                          screenSize: size,
                          color: themeProvider.themeMode == ThemeMode.light
                              ? Colors.black.withOpacity(0.63)
                              : Colors.white,
                          onTap: () {},
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 7, right: 7),
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.send,
                            size: 22,
                            color: themeProvider.themeMode == ThemeMode.light
                                ? Colors.black.withOpacity(0.63)
                                : Colors.white,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Icon(
                          Icons.more_vert,
                          color: themeProvider.themeMode == ThemeMode.light
                              ? Colors.black.withOpacity(0.63)
                              : Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: isGridView
                ? GridView.builder(
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 11,
                      mainAxisExtent: size.height * 0.18,
                    ),
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    itemCount: 4,
                    itemBuilder: (context, inddex) {
                      return gridView(title: 'title');
                    },
                  )
                : ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: SlideLink(),
                      );
                    },
                  ),
          )
        ],
      ),
    );
  }
}

class gridView extends StatelessWidget {
  const gridView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
        color: themeProvider.themeMode == ThemeMode.light
            ? Colors.white
            : TreeVedAppTheme.boxColorDark,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: themeProvider.themeMode == ThemeMode.light
                ? TreeVedAppTheme.boxBorder
                : TreeVedAppTheme.boxBorderdark),
        boxShadow: [
          BoxShadow(
            color: themeProvider.themeMode == ThemeMode.light
                ? Color(0xff17056EAC)
                : Color(0xff17056EAC),
            blurRadius: 10,
            spreadRadius: 3,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: size.height * 0.14,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(
                  image: AssetImage("assets/movie1.jpg"), fit: BoxFit.cover),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
