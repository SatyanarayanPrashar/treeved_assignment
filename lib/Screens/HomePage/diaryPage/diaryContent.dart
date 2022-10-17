import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:treeved_assignment/package/slideLink.dart';

class DiaryContent extends StatelessWidget {
  const DiaryContent(
      {super.key, required this.entryDate, required this.isGridview});

  final String entryDate;
  final bool isGridview;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(11, 21, 11, 4),
          child: Text(entryDate,
              style: const TextStyle(
                  color: Color(0xffCC072B67),
                  fontWeight: FontWeight.w500,
                  fontSize: 17)),
        ),
        const Divider(thickness: 2),
        Expanded(
            child: isGridview
                ? GridView.builder(
                    physics: BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(
                        left: 11, right: 11, top: 11, bottom: 11),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 11,
                      mainAxisExtent: size.height * 0.18,
                    ),
                    itemCount: 4,
                    itemBuilder: (context, inddex) {
                      return gridView(title: 'title');
                    },
                  )
                : ListView.builder(
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return listView();
                    },
                  )),
        const Divider(thickness: 2),
      ],
    );
  }
}

class listView extends StatelessWidget {
  const listView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.all(11),
          child: ExpandableText(
            "text asd;sdlijavva vfdivjavj;vjanvlsvnanvadnv;ivjav.nvav vv svnav.avjv;lijva. v vsnvinvavn;vna/sv z. cs;c s.vj;as.vidjalsjvdvkj pojdxv;s.ljdkdvn .lixkfjcvj kfxncv.lknflckv.ifxkhcvfi.l",
            expandText: "more",
            collapseText: "show less",
            maxLines: 3,
            linkColor: Colors.grey,
            linkStyle: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 11),
          child: SlideLink(),
        ),
      ],
    );
  }
}

class gridView extends StatelessWidget {
  const gridView({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Colors.grey.withOpacity(0.3)),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 223, 223, 223),
            blurRadius: 5,
            spreadRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
              padding: EdgeInsets.all(2),
              child: Container(
                height: size.height * 0.14,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                      image: AssetImage("assets/movie1.jpg"),
                      fit: BoxFit.cover),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(2),
            child: Text(
              title,
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
