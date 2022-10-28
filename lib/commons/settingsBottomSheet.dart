import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/colors.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/Constants/themes.dart';
import 'package:treeved_assignment/commons/bottomSheet.dart';
import 'package:treeved_assignment/commons/bottomsheetItem.dart';

class settingsBottomsheet extends StatefulWidget {
  const settingsBottomsheet({super.key, this.isUserProfile});

  final bool? isUserProfile;

  @override
  State<settingsBottomsheet> createState() => _settingsBottomsheetState();
}

class _settingsBottomsheetState extends State<settingsBottomsheet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);

    return CustomBottomSheet(
        height: (widget.isUserProfile ?? false)
            ? size.height * 0.55
            : size.height * 0.35,
        childern: (widget.isUserProfile ?? false)
            ? [
                //
                BottomSheetItems(
                    onTap: () {
                      //
                    },
                    title: "Recommendations"),
                BottomSheetItems(
                    onTap: () {
                      //
                    },
                    title: "Copy Profile URL"),
                BottomSheetItems(
                    onTap: () {
                      //
                    },
                    title: "About"),
                BottomSheetItems(
                    onTap: () {
                      //
                    },
                    title: "Privacy Policy"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BottomSheetItems(onTap: () {}, title: "Choose your theme"),
                    InkWell(
                      onTap: () {
                        themeProvider.toggleTheme();
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeProvider.themeMode == ThemeMode.light
                              ? Colors.white
                              : Color.fromARGB(255, 57, 60, 72),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                              color: themeProvider.themeMode == ThemeMode.light
                                  ? Color(0xffEAEAEA)
                                  : TreeVedAppTheme.boxBorderdark),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(11, 4, 11, 4),
                          child: Row(
                            children: [
                              Icon((themeProvider.themeMode == ThemeMode.light)
                                  ? Icons.dark_mode
                                  : Icons.light_mode),
                              Text((themeProvider.themeMode == ThemeMode.light)
                                  ? "  Dark mode  "
                                  : "  Light mode  ")
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: themeProvider.themeMode == ThemeMode.light
                        ? Colors.white
                        : Color.fromARGB(255, 57, 60, 72),
                    border: Border.all(
                      color: TreeVedAppTheme.primaryColor,
                    ),
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: const Offset(0, 0),
                          blurRadius: 4,
                          color: Colors.black.withOpacity(0.25))
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: Icon(Icons.pages_outlined),
                              title: Text('My Pages'),
                              onTap: () async {
                                //
                              },
                            ),
                          ),
                          Text(
                            "|",
                            style: TextStyle(fontSize: 0.02 * size.height),
                          ),
                          Expanded(
                            child: ListTile(
                              leading: Icon(
                                Icons.note_add_outlined,
                              ),
                              title: Text('Create a Page'),
                              onTap: () async {
                                //
                              },
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ListTile(
                              leading: Icon(Icons.group_outlined),
                              title: Text('My Groups'),
                              onTap: () async {
                                //
                              },
                            ),
                          ),
                          Text(
                            "|",
                            style: TextStyle(fontSize: 0.02 * size.height),
                          ),
                          Expanded(
                            child: ListTile(
                              leading: Icon(Icons.group_add_outlined),
                              title: Text('Create a Group'),
                              onTap: () async {
                                //
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                BottomSheetItems(
                    onTap: () {
                      //
                    },
                    title: "Log Out"),
              ]
            : [
                BottomSheetItems(
                    onTap: () {
                      //
                    },
                    title: "Follow"), // Unfollow if already following
                BottomSheetItems(
                    onTap: () {
                      //
                    },
                    title: "Message"),
                BottomSheetItems(
                    onTap: () {
                      //
                    },
                    title: "Copy Profile URL"),
                BottomSheetItems(
                    onTap: () {
                      //
                    },
                    title: "Report"),
                BottomSheetItems(
                    onTap: () {
                      //
                    },
                    title: "Block"),
              ]);
  }
}
