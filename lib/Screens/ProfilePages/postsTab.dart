import 'package:flutter/material.dart';
import 'package:treeved_assignment/commons/postTile.dart';

class PostTab extends StatefulWidget {
  const PostTab({super.key, this.isUserPost});
  final bool? isUserPost;

  @override
  State<PostTab> createState() => _PostTabState();
}

class _PostTabState extends State<PostTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) =>
            PostTile(isUserPost: widget.isUserPost),
      ),
    );
  }
}
