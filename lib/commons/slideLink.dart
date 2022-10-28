import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/colors.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/commons/linkBottomsheet.dart';
import 'package:treeved_assignment/package/slidable_links/slidable.dart';
import '../package/slidable_links/action_pane_motions.dart';
import '../package/slidable_links/actions.dart';

class SlideLink extends StatefulWidget {
  const SlideLink({super.key, this.isUserLink});

  final bool? isUserLink;

  @override
  State<SlideLink> createState() => _SlideLinkState();
}

class _SlideLinkState extends State<SlideLink> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => {
              //
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Actionmessage(
                  message: 'Link added to list!',
                ),
                duration: Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                elevation: 0,
                backgroundColor: Colors.transparent,
              ))
            },
            icon: Icons.list,
            label: "Add to List",
            backgroundColor: const Color.fromARGB(255, 211, 231, 244),
          ),
          // Slid
        ],
      ),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              //
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Actionmessage(
                  message: 'Link added to Diary!',
                ),
                duration: Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                elevation: 0,
                backgroundColor: Colors.transparent,
              ));
            },
            icon: Icons.book_outlined,
            label: "Add to Diary",
            backgroundColor: Color.fromARGB(255, 211, 231, 244),
          ),
        ],
      ),
      child: LinkTab(isUserLink: widget.isUserLink),
    );
  }
}

class Actionmessage extends StatelessWidget {
  const Actionmessage({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 211, 231, 244),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 173, 173, 173),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const Icon(
            Icons.done,
            color: Colors.green,
          )
        ],
      )),
    );
  }
}

class LinkTab extends StatefulWidget {
  const LinkTab({super.key, this.isUserLink});
  final bool? isUserLink;

  @override
  State<LinkTab> createState() => _LinkTabState();
}

class _LinkTabState extends State<LinkTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);

    return Container(
      margin: const EdgeInsets.fromLTRB(11, 7, 11, 4),
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
                          style: TextStyle(
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
          Flexible(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) =>
                            userLinksheet(isUserPost: widget.isUserLink));
                  },
                  child: Icon(Icons.more_vert)),
            ),
          )
        ],
      ),
    );
  }
}
