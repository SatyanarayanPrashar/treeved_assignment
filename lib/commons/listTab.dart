import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/colors.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/Screens/ListPages/listViewScreen.dart';
import 'package:treeved_assignment/commons/listBottomSheet.dart';

class ListTabs extends StatefulWidget {
  const ListTabs({super.key, this.isUserList, this.title});
  final bool? isUserList;
  final String? title;

  @override
  State<ListTabs> createState() => _ListTabsState();
}

class _ListTabsState extends State<ListTabs> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return listScreen(
              listName: widget.title ?? "",
              createdBy: 'Sam Sharma',
              listlength: '8');
        }));
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        height: 88,
        width: double.infinity,
        decoration: BoxDecoration(
          color: themeProvider.themeMode == ThemeMode.light
              ? Colors.white
              : TreeVedAppTheme.boxColorDark,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: themeProvider.themeMode == ThemeMode.light
                  ? Color(0xffEAEAEA)
                  : TreeVedAppTheme.boxBorderdark),
          boxShadow: [
            BoxShadow(
              color: themeProvider.themeMode == ThemeMode.light
                  ? Color(0xff17056EAC)
                  : Colors.transparent,
              blurRadius: 10,
              spreadRadius: 3,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              height: 64,
              width: 64,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                image: const DecorationImage(
                    image: AssetImage("assets/explore.jpg"), fit: BoxFit.cover),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 12, 12, 0),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              widget.title ?? "NA",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color:
                                    themeProvider.themeMode == ThemeMode.light
                                        ? Colors.black.withOpacity(0.8)
                                        : Colors.white,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                //
                                showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) =>
                                      listsheet(isUserList: widget.isUserList),
                                );
                              },
                              child: Icon(
                                Icons.more_vert,
                                size: 21,
                                color:
                                    themeProvider.themeMode == ThemeMode.light
                                        ? Colors.black.withOpacity(0.6)
                                        : Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam lobortis dignissim tortor. Nunc a suscipit libero. Aliquam convallis tellus sit amet rutrum tristique.",
                          overflow: TextOverflow.clip,
                          maxLines: 3,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: themeProvider.themeMode == ThemeMode.light
                                ? Colors.black.withOpacity(0.6)
                                : Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
