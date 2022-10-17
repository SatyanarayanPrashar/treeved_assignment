import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/HomePage/Feedpage/FeedScreen.dart';
import 'package:treeved_assignment/Screens/HomePage/ProfilePages/profilePage.dart';
import 'package:treeved_assignment/package/slideLink.dart';
import 'package:treeved_assignment/package/treevedIcon/treeved_icons_icons.dart';

class PostTile extends StatelessWidget {
  const PostTile({super.key});

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
              padding: const EdgeInsets.all(11),
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
                    },
                    icon: Icon(
                      Icons.more_vert,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  )
                ],
              ),
            ),
          ),

          // Post text
          const Padding(
            padding: EdgeInsets.all(11),
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
          Padding(
            padding: const EdgeInsets.only(right: 0),
            child: SlideLink(),
          ),

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
              children: [
                SizedBox(
                  width: 60,
                  height: 28,
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
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const Spacer(),
                const Text(
                  "73 comments",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
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
                      icon: TreevedIcons.like,
                      screenSize: size,
                      onTap: () {
                        //
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
                      icon: TreevedIcons.share,
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
