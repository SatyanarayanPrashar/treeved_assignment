import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/AuthPages/textField.dart';
import 'package:treeved_assignment/Screens/ListPages/createList.dart';
import 'package:treeved_assignment/Screens/ListPages/selectList.dart';
import 'package:treeved_assignment/commons/commonTextField.dart';

class createDiary extends StatefulWidget {
  const createDiary({super.key});

  @override
  State<createDiary> createState() => _createDiaryState();
}

double sliderValue = 0;
int resourceExpanded = 0;
bool resourceExpandisTapped = false;
String selectedresourceType = "Other";
String selectedPrefrence = "";

class _createDiaryState extends State<createDiary> {
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

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Diary Entry",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
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
              //
            },
            child: Center(
              child: Text(
                "Add to Diary",
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
                              ? Color(0xffCEFFD9)
                              : Colors.white,
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
                              style: TextStyle(color: Colors.black),
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
                              ? Color(0xffCEFFD9)
                              : Colors.white,
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
                            Text(
                              "  Save for later",
                              style: TextStyle(color: Colors.black),
                            ),
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
                                  : Colors.white,
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
