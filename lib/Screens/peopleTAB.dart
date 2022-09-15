import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class peopleTab extends StatelessWidget {
  const peopleTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Container(
            width: double.infinity,
            color: Colors.grey.withOpacity(0.1),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              child: Row(
                children: const [
                  PeopleTabs(
                      name: "Sam Sharma", about: "Designer/Animater/Feminist"),
                  PeopleTabs(
                      name: "Vaibhav Raj", about: "Enterpreneur/Founder: RisK"),
                  PeopleTabs(
                      name: "Satya", about: "Designer/Animater/Feminist"),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
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
                        child: const Text("view all"))
                  ],
                ),
                Container(
                  width: double.infinity,
                  color: Colors.grey.withOpacity(0.1),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    child: Row(
                      children: const [
                        pages_tabs(),
                        pages_tabs(),
                        pages_tabs(),
                        pages_tabs(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PeopleTabs extends StatelessWidget {
  const PeopleTabs({
    Key? key,
    required this.name,
    required this.about,
  }) : super(key: key);

  final String name;
  final String about;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      height: 240,
      width: 165,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 120,
            child: Stack(children: const [
              Positioned(
                top: 15,
                left: 37,
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: Color.fromARGB(255, 240, 239, 239),
                  backgroundImage: AssetImage(""),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Icon(Icons.close),
              )
            ]),
          ),
          Text(
            name,
            style:
                GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
            child: Text(
              about,
              style: TextStyle(fontSize: 12),
            ),
          ),
          OutlinedButton(
              onPressed: () {
                //
              },
              child: const Text("Follow"))
        ],
      ),
    );
  }
}

class pages_tabs extends StatelessWidget {
  const pages_tabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
