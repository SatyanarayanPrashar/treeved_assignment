// CONTAINS ALL THE WIDGETS OF PEOPLE SCREEN (under discover)

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:treeved_assignment/Screens/HomePage/discoverPages/listScreen.dart';
import 'package:treeved_assignment/Screens/ListPages/listViewScreen.dart';
import 'package:treeved_assignment/Screens/pagePages/pageScreen.dart';

class PeopleTabs extends StatelessWidget {
  const PeopleTabs({
    Key? key,
    required this.name,
    required this.about,
    required this.imageDes,
  }) : super(key: key);

  final String name;
  final String about;
  final String imageDes;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      height: 240,
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 120,
            child: Stack(children: [
              Positioned(
                top: 15,
                left: 37,
                child: CircleAvatar(
                  radius: 45,
                  backgroundColor: const Color.fromARGB(255, 240, 239, 239),
                  backgroundImage: AssetImage(imageDes),
                ),
              ),
              const Positioned(
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
    required this.imageDes,
    required this.bgimage,
  }) : super(key: key);

  final String name;
  final String imageDes;
  final String bgimage;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return pageScreen();
        }));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 240,
        width: 170,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.withOpacity(0.3)),
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
                  image: DecorationImage(image: AssetImage(bgimage)),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      bottom: 10,
                      left: 10,
                      child: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor:
                              const Color.fromARGB(255, 230, 230, 230),
                          backgroundImage: AssetImage(imageDes),
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
      ),
    );
  }
}

class ExploreListTabs extends StatelessWidget {
  const ExploreListTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11, right: 11),
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return listScreen(
                listName: "Economics Recources",
                createdBy: 'Sam Sharma',
                listlength: '8');
          }));
        },
        child: Container(
          margin: const EdgeInsets.all(5),
          height: 100,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xffEAEAEA)),
            borderRadius: BorderRadius.circular(4),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 223, 223, 223),
                blurRadius: 5,
                spreadRadius: 1,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              Center(
                child: Container(
                  margin: const EdgeInsets.all(10),
                  height: 80,
                  width: 85,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: const DecorationImage(
                          image: AssetImage("assets/explore.jpg"),
                          fit: BoxFit.cover)),
                ),
              ),
              Flexible(
                flex: 7,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "Economics Resources",
                      style: GoogleFonts.roboto(
                          fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 5),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.only(right: 13.0),
                        // width: 195,
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam lobortis dignissim tortor. Nunc a suscipit libero. Aliquam convallis tellus sit amet rutrum tristique.",
                          overflow: TextOverflow.clip,
                          maxLines: 3,
                          style: GoogleFonts.roboto(fontSize: 15),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: Icon(Icons.more_vert),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MovieListTab extends StatelessWidget {
  const MovieListTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(11, 7, 11, 4),
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Color(0xffEAEAEA)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 223, 223, 223),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            height: 80,
            width: 85,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: const DecorationImage(
                    image: AssetImage("assets/movie1.jpg"), fit: BoxFit.cover)),
          ),
          Flexible(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 11),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        flex: 3,
                        child: Text(
                          "Fight Club",
                          style: GoogleFonts.roboto(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Container(
                            width: 35,
                            decoration: const BoxDecoration(
                                color: Colors.lightGreenAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
                            child: Row(
                              children: const [
                                Text(" 4 "),
                                Icon(Icons.star, size: 15)
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.only(right: 13.0),
                  child: Text(
                    "Movie",
                    style: GoogleFonts.roboto(fontSize: 13),
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    //
                  },
                  child: const Text(
                    "https://www.imdb.com/title/tt0137523/",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 11, color: Colors.blue),
                  ),
                )
              ],
            ),
          ),
          const Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Icon(Icons.more_vert),
            ),
          )
        ],
      ),
    );
  }
}
