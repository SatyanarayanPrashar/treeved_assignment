import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treeved_assignment/Screens/HomePage/discoverPages/WidgetpeopleScreen.dart';
import 'package:treeved_assignment/package/treevedIcon/treeved_icons_icons.dart';

class selectList extends StatefulWidget {
  const selectList({super.key});

  @override
  State<selectList> createState() => _selectListState();
}

bool isSelected = false;

class _selectListState extends State<selectList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              "Select List",
              style:
                  TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    //
                  },
                  icon: Icon(
                    TreevedIcons.discover,
                    color: Colors.black,
                  )),
              IconButton(
                  onPressed: () {
                    //
                  },
                  icon: Icon(
                    Icons.add,
                    color: Colors.black,
                  )),
            ],
          ),
          // body: ListView.builder(
          //   itemCount: 4,
          //   itemBuilder: (context, index) {
          //     return ListTabs(
          //       isSelected: isSelected,
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
