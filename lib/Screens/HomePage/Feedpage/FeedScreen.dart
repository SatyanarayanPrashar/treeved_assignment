import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/Screens/HomePage/Feedpage/addPost.dart';
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
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);

    return Scaffold(
      backgroundColor: Color(0xffFBFCFE),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 3,
        title: Row(
          children: [
            Container(
                height: 37,
                child: themeProvider.themeMode == ThemeMode.light
                    ? Image(image: AssetImage("assets/Icons/Logo_lm.png"))
                    : Image(image: AssetImage("assets/Icons/Logo_dm.png")))
          ],
        ),
      ),
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
                              return addPost();
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
