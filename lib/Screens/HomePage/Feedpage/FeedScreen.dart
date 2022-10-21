import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:treeved_assignment/commons/postTile.dart';
import 'package:treeved_assignment/Screens/ListPages/addLink.dart';
import 'package:treeved_assignment/Screens/ProfilePages/profilePage.dart';
import 'package:treeved_assignment/package/slideLink.dart';
import 'package:treeved_assignment/package/treevedIcon/treeved_icons_icons.dart';

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
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          title: Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfilePage(isUserProfile: true);
                  }));
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/boy1.png"),
                ),
              ),
              SizedBox(width: 10),
              // CircleAvatar(
              //   backgroundImage: AssetImage("assets/Icons/treeved.png"),
              // ),
              Image(image: AssetImage("assets/Icons/TreeVedtext.png"))
            ],
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return addLink();
          }));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return PostTile(isUserPost: false);
        },
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
  final height;
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
