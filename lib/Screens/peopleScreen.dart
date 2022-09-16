import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treeved_assignment/Screens/WidgetpeopleScreen.dart';
import 'package:treeved_assignment/Screens/slideLink.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

List<String> tabs = ["People", "Pages", "Lists", "Movies", "Books", "Art"];

int current = 0;

class _PeopleScreenState extends State<PeopleScreen> {
  // int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 11),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 7),
              //
              Container(
                color:
                    const Color.fromARGB(255, 209, 209, 209).withOpacity(0.1),
                height: 240,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      PeopleTabs(
                        name: 'Sam Sharma',
                        about: 'Designer/Animator/Feminist',
                        imageDes: 'assets/girl1.jpg',
                      ),
                      PeopleTabs(
                        name: 'Vaibhav Raj',
                        about: 'Entrepreneur/Founder: Risk',
                        imageDes: 'assets/boy1.png',
                      ),
                      PeopleTabs(
                        name: 'Sam Sharma',
                        about: 'Designer/Animator/Feminist',
                        imageDes: 'assets/girl1.jpg',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.table_chart_outlined),
                  const SizedBox(width: 20),
                  Text("Pages you may like",
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
              Container(
                color:
                    const Color.fromARGB(255, 209, 209, 209).withOpacity(0.1),
                height: 240,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: const [
                      Pagestabs(
                        name: 'Microanimations',
                        imageDes: 'assets/girl2.jpg',
                        bgimage: 'assets/back1.jpg',
                      ),
                      Pagestabs(
                        name: 'Cinematography and Design',
                        imageDes: 'assets/boy2.png',
                        bgimage: 'assets/back2.jpg',
                      ),
                      Pagestabs(
                        name: 'Art Club',
                        imageDes: 'assets/girl2.jpg',
                        bgimage: 'assets/back1.jpg',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Row(
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
                  const SizedBox(width: 11),
                ],
              ),
              const ExploreListTabs(),
              const ExploreListTabs(),
              const ExploreListTabs(),
              Row(
                children: [
                  const Icon(Icons.local_movies_outlined),
                  const SizedBox(width: 20),
                  Text("Movies",
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
              SlideLink(),
              SlideLink(),
              SlideLink(),
            ],
          ),
        ),
      ),
    );
  }
}
