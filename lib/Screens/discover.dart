import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treeved_assignment/Screens/peopleTAB.dart';

class DiscoverPage extends StatefulWidget {
  const DiscoverPage({super.key});

  @override
  State<DiscoverPage> createState() => _DiscoverPageState();
}

List<String> tabs = ["People", "Pages", "Lists", "Movies", "Books", "Art"];

int current = 0;

class _DiscoverPageState extends State<DiscoverPage> {
  // int _selectedIndex = 0;

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        title: const Text(
          "Discover",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        actions: const [Icon(Icons.search)],
      ),
      //
      body: Padding(
        padding: const EdgeInsets.only(left: 11, right: 11),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 7),
              SizedBox(
                height: 45,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: tabs.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        width: 90,
                        decoration: BoxDecoration(
                          color: current == index ? Colors.blue : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: current == index ? Colors.blue : Colors.grey,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            tabs[index],
                            style: GoogleFonts.roboto(
                              color:
                                  current == index ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 10),
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
                      ),
                      PeopleTabs(
                        name: 'Vaibhav Raj',
                        about: 'Entrepreneur/Founder: Risk',
                      ),
                      PeopleTabs(
                        name: 'Sam Sharma',
                        about: 'Designer/Animator/Feminist',
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
                      child: const Text("See all"))
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
                      ),
                      Pagestabs(
                        name: 'Cinematography and Design',
                      ),
                      Pagestabs(
                        name: 'Art Club',
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
                      child: const Text("See more"))
                ],
              ),
              const ExploreListTabs()
            ],
          ),
        ),
      ),
    );
  }
}
