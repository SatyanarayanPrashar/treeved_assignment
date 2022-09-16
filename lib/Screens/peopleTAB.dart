import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      margin: const EdgeInsets.only(right: 10),
      height: 240,
      width: 170,
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
              style: const TextStyle(fontSize: 12),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              //
            },
            child: const Text("  Follow  "),
          )
        ],
      ),
    );
  }
}

class Pagestabs extends StatelessWidget {
  const Pagestabs({
    Key? key,
    required this.name,
  }) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 240,
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 120,
              width: 165,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: const DecorationImage(image: AssetImage("")),
              ),
              child: Stack(
                children: const [
                  Positioned(
                    bottom: 10,
                    left: 10,
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: Color.fromARGB(255, 230, 230, 230),
                        backgroundImage: AssetImage(""),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Text(
            name,
            textAlign: TextAlign.center,
            style:
                GoogleFonts.roboto(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          const Spacer(),
          ElevatedButton(
            onPressed: () {
              //
            },
            child: const Text("  Follow  "),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

class ExploreListTabs extends StatelessWidget {
  const ExploreListTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(),
      ),
    );
  }
}
