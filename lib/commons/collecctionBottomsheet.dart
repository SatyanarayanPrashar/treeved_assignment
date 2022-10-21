import 'package:flutter/material.dart';
import 'package:treeved_assignment/commons/bottomSheet.dart';
import 'package:treeved_assignment/commons/bottomsheetItem.dart';

class collectionsheet extends StatefulWidget {
  const collectionsheet({super.key, this.isUserCollection});

  final bool? isUserCollection;

  @override
  State<collectionsheet> createState() => _collectionsheetState();
}

class _collectionsheetState extends State<collectionsheet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return CustomBottomSheet(
        height: (widget.isUserCollection ?? false)
            ? size.height * 0.3
            : size.height * 0.24,
        childern: (widget.isUserCollection ?? false)
            ? [
                BottomSheetItems(
                  onTap: () {
                    //
                  },
                  title:
                      "Edit", //if already pinned text will be unpin from profile
                ),
                BottomSheetItems(
                  onTap: () {
                    //
                  },
                  title: "Add a list",
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
