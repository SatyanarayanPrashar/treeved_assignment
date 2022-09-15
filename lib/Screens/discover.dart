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
      body: Container(
        margin: const EdgeInsets.all(5),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 50,
              width: double.infinity,
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
            peopleTab(),
          ],
        ),
      ),
    );
  }
}
