import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/HomePage/diaryPage/calenderHeader.dart';
import 'package:treeved_assignment/Screens/HomePage/diaryPage/createDiary.dart';
import 'package:treeved_assignment/Screens/HomePage/diaryPage/diaryContent.dart';
import 'package:treeved_assignment/Screens/ProfilePages/profilePage.dart';
import 'package:treeved_assignment/package/date_utils.dart' as date_util;

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});
  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

bool isGridView = false;

class _DiaryPageState extends State<DiaryPage> {
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currenDateTime = DateTime.now();

  @override
  void initState() {
    super.initState();
    currentMonthList = date_util.DateUtils.daysInMonth(currenDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 45.0 * currenDateTime.day);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 67 + size.height * 0.2,
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
                          child: InkWell(
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProfilePage(isUserProfile: true);
                              }));
                            },
                            child: const CircleAvatar(
                              radius: 20,
                              backgroundImage: AssetImage("assets/boy1.png"),
                            ),
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
                CalenderTab(
                  currentMonthList: currentMonthList,
                  scrollController: scrollController,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              //
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return createDiary();
              }));
            },
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Icon(Icons.add),
          ),
          body: DiaryContent(
            isGridview: isGridView,
            entryDate: date_util.DateUtils.months[currenDateTime.month - 1] +
                " " +
                currenDateTime.day.toString(),
          )),
    );
  }
}
