import 'package:flutter/material.dart';
import 'package:treeved_assignment/package/date_utils.dart' as date_util;

class CalenderTab extends StatefulWidget {
  const CalenderTab({super.key});

  @override
  State<CalenderTab> createState() => _CalenderTabState();
}

class _CalenderTabState extends State<CalenderTab> {
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

    return Container(
      height: size.height * 0.225,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(11, 0, 11, 11),
        child: Column(
          children: [
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date_util.DateUtils.months[currenDateTime.month - 1],
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    child: Row(children: [
                      InkWell(
                        onTap: () {
                          //
                        },
                        child: const Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Color(0xff666666),
                        ),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: () {
                          //
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios,
                          size: 20,
                          color: Color(0xff666666),
                        ),
                      )
                    ]),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 90,
              child: ListView.builder(
                itemCount: currentMonthList.length,
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var today = currentMonthList[index].day;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currenDateTime = currentMonthList[index];
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(7, 11, 7, 11),
                      child: Container(
                        height: 60,
                        width: 44,
                        decoration: BoxDecoration(
                            color: (today > currenDateTime.day)
                                ? Colors.white
                                : const Color(0xffF4F6F9),
                            borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 11),
                                child: Text(
                                  date_util.DateUtils.weekdays[
                                      currentMonthList[index].weekday - 1],
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      color: const Color(0xff658AC7)
                                          .withOpacity(0.5),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            Flexible(
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 11),
                                child: Text(
                                  currentMonthList[index].day.toString(),
                                  style: TextStyle(
                                      color: Color(0xff658AC7).withOpacity(0.5),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 7),
              child: Container(
                height: 45,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  physics: BouncingScrollPhysics(),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 7),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Color(0xff658AC7),
                              )),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(11, 7, 11, 7),
                            child: Text(
                              "Movies 24",
                              style: TextStyle(
                                color: Color(0xff658AC7),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 7),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Color(0xff658AC7),
                              )),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(11, 7, 11, 7),
                            child: Text(
                              "Books 24",
                              style: TextStyle(
                                color: Color(0xff658AC7),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 7),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Color(0xff658AC7),
                              )),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(11, 7, 11, 7),
                            child: Text(
                              "TV Shows 24",
                              style: TextStyle(
                                color: Color(0xff658AC7),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 7),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Color(0xff658AC7),
                              )),
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(11, 7, 11, 7),
                            child: Text(
                              "Movies 24",
                              style: TextStyle(
                                color: Color(0xff658AC7),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
