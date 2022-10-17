import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/HomePage/diaryPage/calenderHeader.dart';
import 'package:treeved_assignment/Screens/HomePage/diaryPage/diaryContent.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});
  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

bool isGridView = false;

class _DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            elevation: 2,
            backgroundColor: Colors.white,
            toolbarHeight: 67 + size.height * 0.225,
            flexibleSpace: Column(
              children: [
                // SizedBox(height: size.height * 0.08),
                Padding(
                  padding: const EdgeInsets.only(top: 11, bottom: 11),
                  child: SizedBox(
                    height: 45,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 11, right: 4),
                          child: CircleAvatar(
                            radius: 20,
                            backgroundImage: AssetImage("assets/boy1.png"),
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "My Diary",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, color: Colors.black),
                        ),
                        Spacer(),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                isGridView = !isGridView;
                              });
                            },
                            icon: isGridView
                                ? Icon(
                                    Icons.menu_outlined,
                                    color: Color(0xff666666),
                                  )
                                : Icon(
                                    Icons.grid_view,
                                    color: Color(0xff666666),
                                  )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.search_outlined,
                              color: Color(0xff666666),
                            )),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.calendar_month_rounded,
                              color: Color(0xff666666),
                            )),
                      ],
                    ),
                  ),
                ),
                CalenderTab(),
              ],
            ),
          ),
          body: DiaryContent(
            isGridview: isGridView,
            entryDate: 'October 17',
          )),
    );
  }
}
