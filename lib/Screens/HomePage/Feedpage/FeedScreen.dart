import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/HomePage/diaryPage/createDiary.dart';
import 'dart:math' as math;
import 'package:treeved_assignment/commons/postTile.dart';
import 'package:treeved_assignment/Screens/ListPages/addLink.dart';
import 'package:treeved_assignment/Screens/ProfilePages/profilePage.dart';
import 'package:treeved_assignment/commons/slideLink.dart';
import 'package:treeved_assignment/package/treevedIcon/treeved_icons_icons.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> with TickerProviderStateMixin {
  late AnimationController _controller;

  static const List<IconData> icons = [
    TreevedIcons.diary,
    Icons.post_add_outlined,
    Icons.list_outlined
  ];

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              // Container(
              //     height: 35,
              //     child: Image(image: AssetImage("assets/Icons/appicon.png"))),
              Container(
                  child:
                      Image(image: AssetImage("assets/Icons/TreeVedtext.png"))),
            ],
          )),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(icons.length, (int index) {
          Widget child = Container(
            height: 55,
            width: 60,
            alignment: FractionalOffset.topCenter,
            child: ScaleTransition(
              scale: CurvedAnimation(
                parent: _controller,
                curve: Interval(0.0, 1.0 - index / icons.length / 2.0,
                    curve: Curves.easeOut),
              ),
              child: FloatingActionButton(
                heroTag: index == 0
                    ? "btn1"
                    : index == 1
                        ? "btn2"
                        : "btn3",
                mini: true,
                child: Icon(icons[index]),
                onPressed: () {
                  index == 0
                      ? Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                          return createDiary();
                        }))
                      : index == 1
                          ? Navigator.push(context, //share as post
                              MaterialPageRoute(builder: (context) {
                              return addLink();
                            }))
                          : Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                              return addLink();
                            }));
                },
              ),
            ),
          );
          return child;
        }).toList()
          ..add(
            FloatingActionButton(
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform(
                    transform:
                        Matrix4.rotationZ(_controller.value * 0.5 * math.pi),
                    alignment: FractionalOffset.center,
                    child:
                        Icon(_controller.isDismissed ? Icons.add : Icons.close),
                  );
                },
              ),
              onPressed: () {
                if (_controller.isDismissed) {
                  _controller.forward();
                } else {
                  _controller.reverse();
                }
              },
            ),
          ),
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
