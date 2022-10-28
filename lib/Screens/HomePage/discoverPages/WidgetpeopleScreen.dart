// CONTAINS ALL THE WIDGETS OF PEOPLE SCREEN (under discover)

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/colors.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/Screens/ProfilePages/profilePage.dart';
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
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProfilePage(isUserProfile: false)));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        height: 240,
        width: 170,
        decoration: BoxDecoration(
          color: themeProvider.themeMode == ThemeMode.light
              ? Colors.white
              : TreeVedAppTheme.boxColorDark,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              color: themeProvider.themeMode == ThemeMode.light
                  ? Color(0xffEAEAEA)
                  : TreeVedAppTheme.boxBorderdark),
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
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

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
          color: themeProvider.themeMode == ThemeMode.light
              ? Colors.white
              : TreeVedAppTheme.boxColorDark,
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
              color: themeProvider.themeMode == ThemeMode.light
                  ? Color(0xffEAEAEA)
                  : TreeVedAppTheme.boxBorderdark),
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
//
//

            //
            //
          ],
        ),
      ),
    );
  }
}
