import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treeved_assignment/Screens/HomePage/discoverPages/WidgetpeopleScreen.dart';
import 'package:treeved_assignment/commons/listTab.dart';
import 'package:treeved_assignment/commons/slideLink.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 7),
            //
            Padding(
              padding: const EdgeInsets.only(left: 11),
              child: Container(
                color:
                    const Color.fromARGB(255, 209, 209, 209).withOpacity(0.1),
                height: 240,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemCount: 6,
                  itemBuilder: (context, index) => PeopleTabs(
                    name: 'Sam Sharma',
                    about: 'Designer/Animator/Feminist',
                    imageDes: 'assets/girl1.jpg',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
              child: Row(
                children: [
                  const Icon(Icons.table_chart_outlined),
                  const SizedBox(width: 10),
                  Text("Pages you may like",
                      style: GoogleFonts.roboto(
                          fontSize: 17, fontWeight: FontWeight.w400)),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        //
                      },
                      child: const Text("See more")),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 11),
              child: Container(
                color:
                    const Color.fromARGB(255, 209, 209, 209).withOpacity(0.1),
                height: 240,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 6,
                  itemBuilder: (context, index) => Pagestabs(
                    name: 'Microanimations',
                    imageDes: 'assets/girl2.jpg',
                    bgimage: 'assets/back1.jpg',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
              child: Row(
                children: [
                  const Icon(Icons.list),
                  const SizedBox(width: 20),
                  Text("Explore Lists",
                      style: GoogleFonts.roboto(
                          fontSize: 17, fontWeight: FontWeight.w400)),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        //
                      },
                      child: const Text("See more")),
                ],
              ),
            ),
            const ListTabs(isUserList: false),
            const ListTabs(isUserList: false),
            const ListTabs(isUserList: false),

            Padding(
              padding: const EdgeInsets.fromLTRB(11, 0, 0, 0),
              child: Row(
                children: [
                  const Icon(Icons.local_movies_outlined),
                  const SizedBox(width: 20),
                  Text("Articles",
                      style: GoogleFonts.roboto(
                          fontSize: 17, fontWeight: FontWeight.w400)),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        //
                      },
                      child: const Text("See more")),
                  const SizedBox(width: 11),
                ],
              ),
            ),
            SlideLink(),
            SlideLink(),
            SlideLink(),
          ],
        ),
      ),
    );
  }
}
