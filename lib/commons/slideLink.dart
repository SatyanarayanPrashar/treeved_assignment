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
      child: LinkTab(
        isUserLink: widget.isUserLink,
        title: "Fight Club",
      ),
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
      margin: EdgeInsets.all(12),
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
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const Icon(
              Icons.done,
              color: Colors.green,
            )
          ],
        ),
      ),
    );
  }
}

class LinkTab extends StatefulWidget {
  const LinkTab({super.key, this.isUserLink, this.title});
  final bool? isUserLink;
  final String? title;

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
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 4),
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: themeProvider.themeMode == ThemeMode.light
            ? Colors.white
            : TreeVedAppTheme.boxColorDark,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
            color: themeProvider.themeMode == ThemeMode.light
                ? TreeVedAppTheme.boxBorder
                : TreeVedAppTheme.boxBorderdark),
        boxShadow: [
          BoxShadow(
            color: themeProvider.themeMode == ThemeMode.light
                ? Color(0xff17056EAC)
                : Color(0xff17056EAC),
            blurRadius: 10,
            spreadRadius: 3,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.all(12),
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: const DecorationImage(
                      image: AssetImage("assets/movie1.jpg"),
                      fit: BoxFit.cover)),
            ),
            Flexible(
              flex: 7,
              child: Container(
                color: Colors.yellow,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            widget.title ?? "NA",
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: themeProvider.themeMode == ThemeMode.light
                                  ? Colors.black.withOpacity(0.8)
                                  : Colors.white,
                            ),
                          ),
                          Spacer(),
                          Container(
                            // padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
                            width: 37,
                            height: 21,
                            decoration: const BoxDecoration(
                                color: Color(0xffCEFFD9),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  " 4 ",
                                  style: TextStyle(
                                    color: Color(0xff1F4E0F),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Icon(
                                  Icons.star,
                                  size: 12,
                                  color: Color(0xff1F4E0F),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) => userLinksheet(
                                      isUserPost: widget.isUserLink));
                            },
                            child: Icon(
                              Icons.more_vert,
                              size: 21,
                              color: themeProvider.themeMode == ThemeMode.light
                                  ? Colors.black.withOpacity(0.6)
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),

                      Container(
                        padding: const EdgeInsets.only(right: 13.0),
                        child: Text(
                          "Movie",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            color: themeProvider.themeMode == ThemeMode.light
                                ? Colors.black.withOpacity(0.3)
                                : Colors.white,
                          ),
                        ),
                      ),
                      // const SizedBox(height: 20),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          //
                        },
                        child: const Text(
                          "https://www.imdb.com/title/tt0137523/",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11,
                            color: Color(0xff008FE4),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
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
