import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/colors.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/Screens/groupPages/channelScreen.dart';
import 'package:treeved_assignment/package/treevedIcon/treeved_icons_icons.dart';

class groupPage extends StatelessWidget {
  const groupPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Group",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: themeProvider.themeMode == ThemeMode.light
                      ? Colors.black
                      : Colors.black),
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
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Padding(
            padding: const EdgeInsets.all(11),
            child: SizedBox(
              height: 50,
              width: size.width,
              child: FloatingActionButton(
                onPressed: () {
                  //
                },
                backgroundColor: themeProvider.themeMode == ThemeMode.light
                    ? Colors.white
                    : Colors.grey,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                      SizedBox(width: 11),
                      Text(
                        "New Channel",
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: Column(
            children: [
              Padding(
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
                        padding: EdgeInsets.fromLTRB(7, 0, 7, 11),
                        child: Row(
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(24),
                                image: DecorationImage(
                                  image: AssetImage("assets/back1.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: 7),
                            Container(
                              height: 45,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Film and Media Coumunity",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Number of members: ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: themeProvider.themeMode ==
                                                  ThemeMode.light
                                              ? Colors.black.withOpacity(0.6)
                                              : Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        "126",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: themeProvider.themeMode ==
                                                  ThemeMode.light
                                              ? Colors.black.withOpacity(0.6)
                                              : Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
                        child: Text(
                          "Group Description",
                          style: TextStyle(
                              color: themeProvider.themeMode == ThemeMode.light
                                  ? Colors.black.withOpacity(0.6)
                                  : Colors.grey,
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
                          maxLines: 2,
                          linkColor: Colors.grey,
                          linkStyle:
                              TextStyle(decoration: TextDecoration.underline),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GroupsectionTile(
                listCount: '3',
                memberCount: '126',
                title: 'All Members',
              ),
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 4,
                  itemBuilder: (context, index) => GroupsectionTile(
                      title: "Photography", listCount: "3", memberCount: "46"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GroupsectionTile extends StatelessWidget {
  const GroupsectionTile(
      {super.key,
      required this.title,
      required this.listCount,
      required this.memberCount});
  final String title;
  final String listCount;
  final String memberCount;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.all(11),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return channelScreen();
          }));
        },
        child: Container(
          height: 55,
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
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(11),
                child: Container(
                  width: 10,
                  height: size.height * 0.027,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(2)),
                ),
              ),
              Text(
                title,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              Expanded(
                  child: SizedBox(
                width: 500,
              )),
              Padding(
                padding: const EdgeInsets.only(right: 7),
                child: Container(
                  padding: EdgeInsets.fromLTRB(9, 2, 9, 2),
                  decoration: BoxDecoration(
                    color: Color(0xffEFF3FB),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.list,
                        color: Color(0xff658AC7),
                        size: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          listCount,
                          style: TextStyle(
                            color: Color(0xff658AC7),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 7),
                child: Container(
                  // width: size.width * 0.15,
                  padding: EdgeInsets.fromLTRB(9, 2, 9, 2),
                  decoration: BoxDecoration(
                    color: Color(0xffEFF3FB),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.people_outline,
                        color: Color(0xff658AC7),
                        size: 16,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Text(
                          memberCount,
                          style: TextStyle(
                            color: Color(0xff658AC7),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
