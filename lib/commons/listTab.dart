import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/colors.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/Screens/ListPages/listViewScreen.dart';
import 'package:treeved_assignment/commons/listBottomSheet.dart';

class ListTabs extends StatefulWidget {
  const ListTabs({super.key, this.isUserList});
  final bool? isUserList;

  @override
  State<ListTabs> createState() => _ListTabsState();
}

class _ListTabsState extends State<ListTabs> {
  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);

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
            color: themeProvider.themeMode == ThemeMode.light
                ? Colors.white
                : TreeVedAppTheme.boxColorDark,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
                color: themeProvider.themeMode == ThemeMode.light
                    ? Color(0xffEAEAEA)
                    : TreeVedAppTheme.boxBorderdark),
            boxShadow: [
              BoxShadow(
                color: themeProvider.themeMode == ThemeMode.light
                    ? Color.fromARGB(255, 223, 223, 223)
                    : Colors.white.withOpacity(0.3),
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
              Flexible(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(top: 11),
                  child: InkWell(
                      onTap: () {
                        //
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) =>
                              listsheet(isUserList: widget.isUserList),
                        );
                      },
                      child: Icon(Icons.more_vert)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
