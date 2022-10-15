import 'package:flutter/material.dart';

class CollectionTab extends StatelessWidget {
  const CollectionTab({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: const Icon(Icons.add),
      ),
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
        itemCount: 18,
        itemBuilder: (context, inddex) {
          return const CollectionBloc(
            name: "Entrepreneurship Resources",
            linkCount: '52',
            listCount: '7',
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
      required this.linkCount});

  final String name;
  final String? listCount;
  final String? linkCount;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      // height: size.height,
      margin: const EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
              offset: const Offset(0, 0),
              blurRadius: 4,
              color: Colors.black.withOpacity(0.25))
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
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                    ),
                  ),
                ),
                Flexible(
                  // flex: 1,
                  child: IconButton(
                    onPressed: () {
                      //
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
