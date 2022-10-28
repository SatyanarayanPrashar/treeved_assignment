import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/HomePage/Feedpage/FeedScreen.dart';
import 'package:treeved_assignment/Screens/ProfilePages/profilePage.dart';
import 'package:treeved_assignment/commons/bottomSheet.dart';
import 'package:treeved_assignment/commons/bottomsheetItem.dart';
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

    return Container(
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ProfilePage(isUserProfile: false);
              }));
            },
            child: Padding(
              padding: const EdgeInsets.fromLTRB(11, 11, 0, 11),
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
            padding: EdgeInsets.fromLTRB(11, 0, 11, 11),
            child: ExpandableText(
              "text asd;sdlijavva vfdivjavj;vjanvlsvnanvadnv;ivjav.nvav vv svnav.avjv;lijva. v vsnvinvavn;vna/sv z. cs;c s.vj;as.vidjalsjvdvkj pojdxv;s.ljdkdvn .lixkfjcvj kfxncv.lknflckv.ifxkhcvfi.l",
              expandText: "more",
              collapseText: "show less",
              maxLines: 3,
              linkColor: Colors.grey,
              linkStyle: TextStyle(decoration: TextDecoration.underline),
            ),
          ),

          // link here
          SlideLink(isUserLink: widget.isUserPost),

          const Padding(
            padding: EdgeInsets.fromLTRB(11, 4, 11, 0),
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
                            backgroundColor: Colors.red,
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
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ),
                      Positioned(
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 11,
                            backgroundColor: Colors.green,
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
                      color: isLiked ? Colors.blue : null,
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
                      screenSize: size,
                      onTap: () {
                        //
                      }),
                  const SizedBox(width: 1),
                  FeedIcons(
                      label: "Share",
                      icon: Icons.share,
                      screenSize: size,
                      onTap: () {
                        //
                      }),
                  const SizedBox(width: 1),
                ],
              ),
            ),
          ),
          Divider(
            color: Colors.grey.withOpacity(0.5),
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
