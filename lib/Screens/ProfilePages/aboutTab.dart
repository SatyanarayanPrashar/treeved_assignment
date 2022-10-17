import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/HomePage/discoverPages/WidgetpeopleScreen.dart';
import 'package:treeved_assignment/package/slideLink.dart';

class AboutTab extends StatefulWidget {
  const AboutTab({super.key});

  @override
  State<AboutTab> createState() => _AboutTabState();
}

class _AboutTabState extends State<AboutTab> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: ListView.builder(
      physics: BouncingScrollPhysics(),
      itemCount: 1,
      itemBuilder: (context, index) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IntroductionTile(),
          InterestsTile(),
          const Padding(
            padding: EdgeInsets.fromLTRB(11, 21, 11, 11),
            child: Text(
              "⭐  Pinned Links",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          const SlideLink(),
          const SlideLink(),
          const SlideLink(),
          const SlideLink(),
          Padding(
            padding: EdgeInsets.fromLTRB(11, 21, 11, 11),
            child: Row(
              children: [
                Image(image: AssetImage("assets/Icons/pin.png")),
                Text(
                  "  Pinned Lists",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          const ExploreListTabs(),
          const ExploreListTabs(),
          const ExploreListTabs(),
          Padding(
            padding: const EdgeInsets.all(11),
            child: Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BottomConnectLinks(
                    imagepath: "assets/Icons/insta.png",
                  ),
                  BottomConnectLinks(
                    imagepath: "assets/Icons/meta.png",
                  ),
                  BottomConnectLinks(
                    imagepath: "assets/Icons/github.png",
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class BottomConnectLinks extends StatelessWidget {
  const BottomConnectLinks({
    Key? key,
    this.imagepath,
    this.linkpath,
  }) : super(key: key);
  final String? imagepath;
  final VoidCallback? linkpath;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 7, right: 7),
      child: InkWell(
          onTap: () {
            //
          },
          child:
              Image(image: AssetImage(imagepath ?? "assets/Icons/insta.png"))),
    );
  }
}

class InterestsTile extends StatelessWidget {
  const InterestsTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(11, 17, 11, 11),
      child: Container(
        // height: 180,
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(255, 223, 223, 223),
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(7),
          child: Wrap(
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.start,
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            spacing: 8,
            runSpacing: 8,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(17, 7, 17, 7),
                decoration: BoxDecoration(
                  color: Color(0xffEFF3FB),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  "Economics",
                  style: TextStyle(
                    color: Color(0xff658AC7),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 7, 17, 7),
                decoration: BoxDecoration(
                  color: Color(0xffEFF3FB),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  "Matematics",
                  style: TextStyle(
                    color: Color(0xff658AC7),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 7, 17, 7),
                decoration: BoxDecoration(
                  color: Color(0xffEFF3FB),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  "Science",
                  style: TextStyle(
                    color: Color(0xff658AC7),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(17, 7, 17, 7),
                decoration: BoxDecoration(
                  color: Color(0xffEFF3FB),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(
                  "Crypto",
                  style: TextStyle(
                    color: Color(0xff658AC7),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IntroductionTile extends StatelessWidget {
  const IntroductionTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(11, 17, 11, 11),
      child: Container(
        padding: const EdgeInsets.fromLTRB(11, 17, 11, 11),
        width: size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.fromLTRB(7, 0, 7, 0),
              child: Text(
                "Introduction",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(7),
              child: ExpandableText(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu sed ipsum nunc a id dictumst dolor a quis suspendisse Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu sed ipsum nunc a id dictumst dolor a quis suspendisse Lorem ipsum dolor sit amet, consectetur adipiscing elit. Arcu sed ipsum nunc a id dictumst dolor a quis suspendisse",
                expandText: "more",
                collapseText: "show less",
                maxLines: 3,
                linkColor: Colors.grey,
                linkStyle: TextStyle(decoration: TextDecoration.underline),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
