import 'package:flutter/material.dart';

class DiaryPage extends StatefulWidget {
  const DiaryPage({super.key});

  @override
  State<DiaryPage> createState() => _DiaryPageState();
}

class _DiaryPageState extends State<DiaryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        title: Container(
          width: 140,
          child: Row(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/boy1.png"),
              ),
              SizedBox(width: 10),
              const Text(
                "My Diary",
                style:
                    TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Color(0xff666666),
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search_outlined,
                color: Color(0xff666666),
              )),
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.calendar_month_rounded,
                color: Color(0xff666666),
              )),
        ],
      ),
    );
  }
}
