import 'package:flutter/material.dart';
import 'package:treeved_assignment/commons/bottomSheet.dart';
import 'package:treeved_assignment/commons/bottomsheetItem.dart';

class listsheet extends StatefulWidget {
  const listsheet({super.key, this.isUserList});

  final bool? isUserList;

  @override
  State<listsheet> createState() => _listsheetState();
}

class _listsheetState extends State<listsheet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CustomBottomSheet(
        height: (widget.isUserList ?? false)
            ? size.height * 0.3
            : size.height * 0.24,
        childern: (widget.isUserList ?? false)
            ? [
                BottomSheetItems(
                  onTap: () {
                    //
                  },
                  title:
                      "Pin to Profile", //if already pinned text will be unpin from profile
                ),
                BottomSheetItems(
                  onTap: () {
                    //
                  },
                  title: "Move List",
                ),
                BottomSheetItems(
                  onTap: () {
                    //
                  },
                  title: "Copy List",
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
              ]
        // other user
        );
  }
}
