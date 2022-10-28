import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/colors.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/Screens/HomePage/Feedpage/FeedScreen.dart';
import 'package:treeved_assignment/Screens/ListPages/addLink.dart';
import 'package:treeved_assignment/Screens/ListPages/createList.dart';
import 'package:treeved_assignment/commons/feedIcon.dart';
import 'package:treeved_assignment/commons/slideLink.dart';
import 'package:treeved_assignment/package/treevedIcon/treeved_icons_icons.dart';

class listScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          listName,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          IconButton(
              onPressed: () {
                //
              },
              icon: Icon(TreevedIcons.discover))
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
          Padding(
            /* top INFO contaner */
            padding: EdgeInsets.all(11),
            child: Container(
              padding: EdgeInsets.all(11),
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
                                " " + listlength,
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
                      description ??
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu sed ipsum nunc a id dictumst dolor a quis suspendisse Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu sed ipsum nunc a id dictumst dolor a quis suspendisse Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu sed ipsum nunc a id dictumst dolor a quis suspendisse",
                      expandText: "show more",
                      collapseText: "show less",
                      maxLines: 2,
                      linkColor: Colors.grey,
                      linkStyle:
                          TextStyle(decoration: TextDecoration.underline),
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
                                        createdBy,
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
                            onTap: () {},
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 7, right: 7),
                          child: InkWell(
                            onTap: () {},
                            child: Icon(Icons.send),
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(Icons.more_vert),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: int.tryParse(listlength),
              itemBuilder: (context, index) {
                return SlideLink();
              },
            ),
          )
        ],
      ),
    );
  }
}
