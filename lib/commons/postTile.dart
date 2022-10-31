import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/Screens/HomePage/Feedpage/FeedScreen.dart';
import 'package:treeved_assignment/Screens/ProfilePages/profilePage.dart';
import 'package:treeved_assignment/commons/bottomSheet.dart';
import 'package:treeved_assignment/commons/bottomsheetItem.dart';
import 'package:treeved_assignment/commons/feedIcon.dart';
import 'package:treeved_assignment/commons/slideLink.dart';
import 'package:treeved_assignment/package/treevedIcon/treeved_icons_icons.dart';

class PostTile extends StatefulWidget {
  final bool? isUserPost;

  const PostTile({super.key, this.isUserPost});

  @override
  State<PostTile> createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);

    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfilePage(isUserProfile: widget.isUserPost ?? false);
              }));
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(11, 0, 0, 11),
              child: Row(
                children: [
                  // Avatar , about and options
                  const CircleAvatar(
                    radius: 27,
                    backgroundImage: AssetImage("assets/boy1.png"),
                  ),
                  const SizedBox(
                    width: 7,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "Anupam Mishra",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        "Entrepreneur",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        "18 minutes ago",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      //
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => CustomBottomSheet(
                          height: size.height * 0.25,
                          childern: widget.isUserPost ?? false
                              ? [
                                  BottomSheetItems(
                                    onTap: () {
                                      //
                                    },
                                    title: "Copy Post URL",
                                  ),
                                  BottomSheetItems(
                                    onTap: () {
                                      //
                                    },
                                    title: "Share Post",
                                  ),
                                  BottomSheetItems(
                                    onTap: () {
                                      //
                                    },
                                    title: "Delete",
                                  ),
                                ]
                              : [
                                  BottomSheetItems(
                                    onTap: () {
                                      //
                                    },
                                    title: "Copy Post URL",
                                  ),
                                  BottomSheetItems(
                                    onTap: () {
                                      //
                                    },
                                    title: "Share Post",
                                  ),
                                  BottomSheetItems(
                                    onTap: () {
                                      //
                                    },
                                    title: "Report",
                                  ),
                                ],
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.more_vert,
                    ),
                  )
                ],
              ),
            ),
          ),

          // Post text
          const Padding(
            padding: EdgeInsets.fromLTRB(11, 0, 11, 4),
            child: ExpandableText(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam lobortis dignissim tortor. Nunc a suscipit libero. Aliquam convallis tellus sit amet rutrum tristique.",
              expandText: "more",
              collapseText: "show less",
              maxLines: 3,
              linkColor: Colors.grey,
              linkStyle: TextStyle(decoration: TextDecoration.underline),
            ),
          ),

          const Padding(
            padding: EdgeInsets.fromLTRB(11, 0, 11, 0),
            child: ExpandableText(
              "#movie",
              expandText: "more",
              style: TextStyle(color: Colors.blue),
              collapseText: "show less",
              maxLines: 1,
              linkColor: Colors.grey,
              linkStyle: TextStyle(decoration: TextDecoration.underline),
            ),
          ),

          // link here
          SlideLink(isUserLink: widget.isUserPost),

          // likes
          Padding(
            padding: const EdgeInsets.fromLTRB(11, 7, 11, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60,
                  height: 25,
                  child: Stack(
                    children: const [
                      Positioned(
                        left: 30,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 11,
                            backgroundImage: AssetImage("assets/girl2.jpg"),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 15,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 11,
                            backgroundImage: AssetImage("assets/boy2.png"),
                          ),
                        ),
                      ),
                      Positioned(
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 11,
                            backgroundImage: AssetImage("assets/girl1.jpg"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Text(
                  "420 likes",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                const Text(
                  "73 comments",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),

          // action bar
          Divider(
            color: Colors.grey.withOpacity(0.5),
            thickness: 1,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
            child: Container(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 1),
                  FeedIcons(
                      label: "Like",
                      icon: isLiked
                          ? Icons.thumb_up
                          : Icons.thumb_up_alt_outlined,
                      screenSize: size,
                      color: isLiked
                          ? Colors.blue
                          : themeProvider.themeMode == ThemeMode.light
                              ? Colors.black.withOpacity(0.6)
                              : Colors.white,
                      onTap: () {
                        //
                        setState(() {
                          isLiked = !isLiked;
                        });
                      }),
                  const SizedBox(width: 1),
                  FeedIcons(
                      label: "Comment",
                      icon: TreevedIcons.comment,
                      color: themeProvider.themeMode == ThemeMode.light
                          ? Colors.black.withOpacity(0.6)
                          : Colors.white,
                      screenSize: size,
                      onTap: () {
                        //
                      }),
                  const SizedBox(width: 1),
                  FeedIcons(
                      label: "Share",
                      icon: Icons.share,
                      color: themeProvider.themeMode == ThemeMode.light
                          ? Colors.black.withOpacity(0.6)
                          : Colors.white,
                      screenSize: size,
                      onTap: () {
                        //
                      }),
                  const SizedBox(width: 1),
                ],
              ),
            ),
          ),
          // Divider(
          //   color: Colors.grey.withOpacity(0.5),
          //   thickness: 1,
          // ),
          const Padding(
            padding: EdgeInsets.only(left: 11, top: 4),
            child: Text(
              "Comments",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),

          // if number of comments != 0

          Container(
            child: Padding(
              padding: EdgeInsets.only(left: 11),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CircleAvatar(
                    radius: 12,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 11,
                      backgroundImage: AssetImage("assets/girl2.jpg"),
                    ),
                  ),
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.only(left: 4, right: 11, top: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Elon Musk",
                            style: TextStyle(
                              color: themeProvider.themeMode == ThemeMode.light
                                  ? Colors.black.withOpacity(0.6)
                                  : Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam lobortis dignissim tortor. Nunc a suscipit libero. Aliquam convallis tellus sit amet rutrum tristique.",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: themeProvider.themeMode == ThemeMode.light
                                  ? Colors.black.withOpacity(0.6)
                                  : Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
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
          Divider(
            color: Colors.grey.withOpacity(0.7),
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
