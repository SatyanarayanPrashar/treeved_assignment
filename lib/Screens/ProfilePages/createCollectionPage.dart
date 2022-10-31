import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/colors.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/commons/commonTextField.dart';

import '../HomePage/diaryPage/createDiary.dart';

class createCollectionPage extends StatefulWidget {
  const createCollectionPage({super.key});

  @override
  State<createCollectionPage> createState() => _createCollectionPageState();
}

String selectedVisibility = "Everyone";

class _createCollectionPageState extends State<createCollectionPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Collecction",
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
              //
            },
            child: const Center(
              child: Text(
                "Create Collection",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.05),
          commonTextField(
            inputcontroller: nameController,
            title: "URL*",
            hint: "Paste your link here",
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(11, 0, 11, 11),
            child: Text(
              "Visible to",
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Color(0xff385585)),
            ),
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
                        selectedVisibility = "Everyone";
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(11, 7, 11, 7),
                      decoration: BoxDecoration(
                        color: selectedVisibility == "Everyone"
                            ? themeProvider.themeMode == ThemeMode.light
                                ? Color(0xffCEFFD9)
                                : Color.fromARGB(255, 43, 73, 49)
                            : themeProvider.themeMode == ThemeMode.light
                                ? Colors.white
                                : TreeVedAppTheme.boxColorDark,
                        border: Border.all(
                          color: selectedVisibility == "Everyone"
                              ? Color(0xff40804E)
                              : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.people,
                            size: 17,
                          ),
                          Text("  Everyone"),
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
                        selectedVisibility = "Me";
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(11, 7, 11, 7),
                      decoration: BoxDecoration(
                        color: selectedVisibility == "Me"
                            ? themeProvider.themeMode == ThemeMode.light
                                ? Color(0xffCEFFD9)
                                : Color.fromARGB(255, 43, 73, 49)
                            : themeProvider.themeMode == ThemeMode.light
                                ? Colors.white
                                : TreeVedAppTheme.boxColorDark,
                        border: Border.all(
                          color: selectedVisibility == "Me"
                              ? Color(0xff40804E)
                              : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person_outline_rounded,
                            size: 17,
                          ),
                          Text("  Me"),
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
                        selectedVisibility = "Connections";
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(11, 7, 11, 7),
                      decoration: BoxDecoration(
                        color: selectedVisibility == "Connections"
                            ? themeProvider.themeMode == ThemeMode.light
                                ? Color(0xffCEFFD9)
                                : Color.fromARGB(255, 43, 73, 49)
                            : themeProvider.themeMode == ThemeMode.light
                                ? Colors.white
                                : TreeVedAppTheme.boxColorDark,
                        border: Border.all(
                          color: selectedVisibility == "Connections"
                              ? Color(0xff40804E)
                              : Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.people_outline_rounded,
                            size: 17,
                          ),
                          Text("  Connections"),
                        ],
                      ),
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
