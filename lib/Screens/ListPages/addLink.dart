import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/colors.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/Screens/AuthPages/textField.dart';
import 'package:treeved_assignment/Screens/ListPages/createList.dart';
import 'package:treeved_assignment/Screens/ListPages/selectList.dart';
import 'package:treeved_assignment/commons/commonTextField.dart';

class addLink extends StatefulWidget {
  const addLink({super.key});

  @override
  State<addLink> createState() => _addLinkState();
}

double sliderValue = 0;
int resourceExpanded = 0;
bool resourceExpandisTapped = false;
String selectedresourceType = "Other";
String selectedPrefrence = "";

class _addLinkState extends State<addLink> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController noteController = TextEditingController();
    final resourcetype = [
      'Cource',
      'Lecture',
      'Tutorials',
      'Article',
      'Website',
      'Profiles',
      'Posdcast',
      'Documentary',
      'Movie',
      'TV Show',
      'Book',
      'Game',
      'Music',
      'Playlist',
      'YouTube',
      'Video',
      'Other',
    ];

    Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: Text(
          "Add Link",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: themeProvider.themeMode == ThemeMode.light
                ? Colors.black
                : Colors.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(11),
        child: SizedBox(
          height: 50,
          width: size.width,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return selectList();
              }));
            },
            backgroundColor: Colors.blue,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
            child: Center(
              child: Text(
                "Select List",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.05),
            commonTextField(
              inputcontroller: nameController,
              title: "URL*",
              hint: "Paste your link here",
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 21),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 11),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedPrefrence = "Completed";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(11, 7, 11, 7),
                        decoration: BoxDecoration(
                          color: selectedPrefrence == "Completed"
                              ? themeProvider.themeMode == ThemeMode.light
                                  ? Color(0xffCEFFD9)
                                  : Color.fromARGB(255, 43, 73, 49)
                              : themeProvider.themeMode == ThemeMode.light
                                  ? Colors.white
                                  : TreeVedAppTheme.boxColorDark,
                          border: Border.all(
                            color: selectedPrefrence == "Completed"
                                ? Color(0xff40804E)
                                : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.done,
                              size: 17,
                            ),
                            Text(
                              "  Completed",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 11),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          selectedPrefrence = "Save for later";
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(11, 7, 11, 7),
                        decoration: BoxDecoration(
                          color: selectedPrefrence == "Save for later"
                              ? themeProvider.themeMode == ThemeMode.light
                                  ? Color(0xffCEFFD9)
                                  : Color.fromARGB(255, 43, 73, 49)
                              : themeProvider.themeMode == ThemeMode.light
                                  ? Colors.white
                                  : TreeVedAppTheme.boxColorDark,
                          border: Border.all(
                            color: selectedPrefrence == "Save for later"
                                ? Color(0xff40804E)
                                : Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.bookmark_outline_rounded,
                              size: 17,
                            ),
                            Text("  Save for later"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(11, 0, 11, 11),
              child: Text(
                "Rating",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Color(0xff385585)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(11, 0, 11, 21),
              child: Container(
                height: size.height * 0.1,
                width: size.width,
                decoration: BoxDecoration(
                  color: themeProvider.themeMode == ThemeMode.light
                      ? Colors.white
                      : TreeVedAppTheme.boxColorDark.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(
                      width: themeProvider.themeMode == ThemeMode.light ? 1 : 3,
                      color: themeProvider.themeMode == ThemeMode.light
                          ? Color(0xffEAEAEA)
                          : TreeVedAppTheme.boxBorderdark),
                  boxShadow: [
                    BoxShadow(
                      color: themeProvider.themeMode == ThemeMode.light
                          ? Color.fromARGB(255, 223, 223, 223)
                          : Colors.transparent,
                      blurRadius: 5,
                      spreadRadius: 1,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Slider(
                        divisions: 10,
                        activeColor: Colors.blue,
                        thumbColor: Colors.blue,
                        value: sliderValue,
                        min: 0.0,
                        max: 5.0,
                        onChanged: (value) {
                          setState(() {
                            sliderValue = value;
                          });
                        },
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xffCEFFD9),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(14, 11, 14, 11),
                        child: Text(
                          sliderValue.toString(),
                          // sliderValue.toStringAsFixed(1),
                          style: const TextStyle(
                              fontSize: 14, color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
              ),
            ),
            commonTextField(
              inputcontroller: noteController,
              title: "Add tags",
              hint: "Add hashtags",
            ),
            commonTextField(
              inputcontroller: noteController,
              title: "Add a note",
              hint: "Add a description",
              maxLine: 6,
            ),
            const Padding(
              padding: EdgeInsets.all(11),
              child: Text(
                "Resource type",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Color(0xff385585)),
              ),
            ),
            Stack(
              children: [
                Container(
                  height: 100,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    padding: EdgeInsets.only(
                      top: 0.02 * size.width,
                      left: 0.03 * size.width,
                      right: 0.03 * size.width,
                    ),
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      crossAxisSpacing: 4,
                      mainAxisSpacing: 7,
                      mainAxisExtent: size.width * 0.3,
                      maxCrossAxisExtent: 30,
                    ),
                    itemCount: resourcetype.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 2),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              selectedresourceType = resourcetype[index];
                            });
                          },
                          child: Container(
                            padding: EdgeInsets.fromLTRB(7, 2, 7, 2),
                            decoration: BoxDecoration(
                              color: selectedresourceType == resourcetype[index]
                                  ? Colors.blue
                                  : themeProvider.themeMode == ThemeMode.light
                                      ? Colors.white
                                      : TreeVedAppTheme.boxColorDark,
                              border: Border.all(
                                  color: selectedresourceType ==
                                          resourcetype[index]
                                      ? Colors.blue
                                      : Color(0xffA6BBDE)),
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Container(
                              width: size.width * 0.3,
                              child: Center(
                                child: FittedBox(
                                  fit: BoxFit.fitWidth,
                                  child: Text(
                                    resourcetype[index],
                                    maxLines: 1,
                                    style: selectedresourceType ==
                                            resourcetype[index]
                                        ? TextStyle(color: Colors.white)
                                        : TextStyle(color: Color(0xffA6BBDE)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: 0.02 * size.width,
                    ),
                    child: Container(
                      height: 100,
                      width: 17,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.grey.withOpacity(0.7)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.arrow_forward_ios, color: Colors.white),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(height: 100),
          ],
        ),
      ),
    );
  }
}
