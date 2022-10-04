import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:treeved_assignment/package/slideLink.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "TreeVed",
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w600,
            letterSpacing: 1,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return PostTile();
        },
      ),
    );
  }
}

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
          Padding(
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
            padding: const EdgeInsets.only(right: 11.0),
            child: SlideLink(),
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
                      icon: Icons.thumb_up_alt_outlined,
                      screenSize: size,
                      onTap: () {
                        //
                      }),
                  const SizedBox(width: 1),
                  FeedIcons(
                      label: "Comment",
                      icon: Icons.mode_comment_outlined,
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

class FeedIcons extends StatefulWidget {
  const FeedIcons({
    Key? key,
    required this.label,
    required this.icon,
    this.likeCount,
    required this.screenSize,
    required this.onTap,
    this.color,
    this.height,
    this.width,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final int? likeCount;
  final Color? color;
  final Size screenSize;
  final VoidCallback onTap;

  // ignore: prefer_typing_uninitialized_variables
  final height;

  // ignore: prefer_typing_uninitialized_variables
  final width;

  @override
  State<FeedIcons> createState() => _FeedIconsState();
}

class _FeedIconsState extends State<FeedIcons> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: widget.onTap,
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: 0.033 * widget.screenSize.height,
              color: widget.color,
            ),
            SizedBox(
              height: 0.001 * widget.screenSize.height,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.likeCount?.toString() ?? '',
                    style: TextStyle(
                      fontSize: 0.014 * widget.screenSize.height,
                    )),
                SizedBox(
                  width: 0.01 * widget.screenSize.width,
                ),
                Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 0.0155 * widget.screenSize.height,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
