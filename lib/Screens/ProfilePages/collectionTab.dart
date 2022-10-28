import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/colors.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/Screens/ListPages/createList.dart';
import 'package:treeved_assignment/Screens/ProfilePages/collectionScreen.dart';
import 'package:treeved_assignment/commons/collecctionBottomsheet.dart';

class CollectionTab extends StatefulWidget {
  const CollectionTab({super.key, this.isUserCollection});
  final bool? isUserCollection;

  @override
  State<CollectionTab> createState() => _CollectionTabState();
}

class _CollectionTabState extends State<CollectionTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Scaffold(
      body: GridView.builder(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(
          left: 0.03 * size.width,
          right: 0.03 * size.width,
        ),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 180,
          crossAxisSpacing: 11,
          mainAxisSpacing: 4,
          mainAxisExtent: 130,
        ),
        itemCount: 5,
        itemBuilder: (context, index) {
          return index != 5 - 1
              ? CollectionBloc(
                  isUserCollection: widget.isUserCollection,
                  name: "Entrepreneurship Resources",
                  linkCount: '52',
                  listCount: '7',
                )
              : Container(
                  margin: const EdgeInsets.only(top: 8),
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      Text("Create Collection"),
                    ],
                  ),
                );
        },
      ),
    );
  }
}

class CollectionBloc extends StatelessWidget {
  const CollectionBloc(
      {super.key,
      required this.name,
      required this.listCount,
      required this.linkCount,
      this.isUserCollection});

  final String name;
  final String? listCount;
  final String? linkCount;
  final bool? isUserCollection;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);

    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return collectionScreen(
              isUserCollection: isUserCollection, collectionName: name);
        }));
      },
      child: Container(
        // height: size.height,
        margin: const EdgeInsets.only(top: 8),
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
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(11.0),
              child: Row(
                children: [
                  Container(
                    width: 10,
                    height: size.height * 0.027,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(2)),
                  ),
                  Flexible(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        name,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 15),
                      ),
                    ),
                  ),
                  Flexible(
                    // flex: 1,
                    child: IconButton(
                      onPressed: () {
                        //
                        showModalBottomSheet(
                          context: context,
                          backgroundColor: Colors.transparent,
                          builder: (context) => collectionsheet(
                              isUserCollection: isUserCollection),
                        );
                      },
                      icon: Icon(Icons.more_vert),
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(11),
              child: Row(
                children: [
                  ContentCounts(
                    linkCount: listCount,
                    contentIcon: Icons.list_rounded,
                  ),
                  ContentCounts(
                    linkCount: linkCount,
                    contentIcon: Icons.link,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ContentCounts extends StatelessWidget {
  const ContentCounts({
    Key? key,
    required this.linkCount,
    required this.contentIcon,
  }) : super(key: key);

  final IconData contentIcon;
  final String? linkCount;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        width: size.width * 0.15,
        padding: EdgeInsets.fromLTRB(9, 2, 0, 2),
        decoration: BoxDecoration(
          color: Color(0xffEFF3FB),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Icon(
              contentIcon,
              color: Color(0xff658AC7),
              size: 16,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Text(
                linkCount ?? "0",
                style: TextStyle(
                  color: Color(0xff658AC7),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
