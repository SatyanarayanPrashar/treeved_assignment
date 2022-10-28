import 'package:flutter/material.dart';
import 'package:treeved_assignment/commons/bottomSheet.dart';
import 'package:treeved_assignment/commons/bottomsheetItem.dart';

class userLinksheet extends StatefulWidget {
  const userLinksheet({super.key, this.isUserPost});

  final bool? isUserPost;

  @override
  State<userLinksheet> createState() => _userLinksheetState();
}

class _userLinksheetState extends State<userLinksheet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CustomBottomSheet(
        height: (widget.isUserPost ?? false)
            ? size.height * 0.47
            : size.height * 0.34,
        childern: (widget.isUserPost ?? false)
            ? [
                BottomSheetItems(
                  onTap: () {
                    //
                  },
                  title: "Edit",
                ),
                BottomSheetItems(
                  onTap: () {
                    //
                  },
                  title: "Bookmark",
                ),
                BottomSheetItems(
                  onTap: () {
                    //
                  },
                  title: "Share as a post",
                ),
                BottomSheetItems(
                  onTap: () {
                    //
                  },
                  title: "Recommend",
                ),
                BottomSheetItems(
                  onTap: () {
                    //
                  },
                  title: "Share",
                ),
                BottomSheetItems(
                  onTap: () {
                    //
                  },
                  title: "Pin to my Profile",
                ),
                BottomSheetItems(
                  onTap: () {
                    //
                  },
                  title: "Delete",
                ),
              ]
            :
            // other user
            [
                BottomSheetItems(
                  onTap: () {
                    //
                  },
                  title: "Bookmark",
                ),
                BottomSheetItems(
                  onTap: () {
                    //
                  },
                  title: "Share as a post",
                ),
                BottomSheetItems(
                  onTap: () {
                    //
                  },
                  title: "Recommend",
                ),
                BottomSheetItems(
                  onTap: () {
                    //
                  },
                  title: "Share",
                ),
                BottomSheetItems(
                  onTap: () {
                    //
                  },
                  title: "Report",
                ),
              ]);
  }
}
