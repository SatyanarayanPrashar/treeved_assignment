import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/Feedpage/FeedScreen.dart';
import 'package:treeved_assignment/Screens/Feedpage/postTile.dart';

class PostTab extends StatelessWidget {
  const PostTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) => PostTile(),
      ),
    );
  }
}
