import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:treeved_assignment/Screens/ProfilePages/profile_header.dart';
import 'package:treeved_assignment/package/button_tabbar/buttons_tabbar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ScrollController? _controller;
  @override
  void initState() {
    // TODO: implement initState
    _controller = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool scrollable = true;

    _scrollListener() {
      if (_controller!.offset >= (_controller!.position.maxScrollExtent / 2) &&
          !_controller!.position.outOfRange) {
        print(scrollable);
        setState(() {
          scrollable = !scrollable;
        });
      }
    }

    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        body: Container(
          color: Colors.white,
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: 330,
                floating: false,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  background: Profile_Header(),
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(
                        child: Text(
                      "About",
                      style: TextStyle(color: Colors.black),
                    )),
                    Tab(
                        child: Text(
                      "Posts",
                      style: TextStyle(color: Colors.black),
                    )),
                    Tab(
                        child: Text(
                      "Collections",
                      style: TextStyle(color: Colors.black),
                    )),
                  ],
                ),
              ),

              SliverFillRemaining(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      controller: _controller,
                      physics: scrollable
                          ? NeverScrollableScrollPhysics()
                          : AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          Container(
                            height: size.height,
                            color: Colors.pinkAccent,
                            child: Center(child: Text("ok1")),
                          ),
                          Container(
                            height: size.height,
                            color: Colors.yellowAccent,
                            child: Center(child: Text("ok2")),
                          )
                        ],
                      ),
                    ),
                    Center(child: Text("Tab 2")),
                    Container(child: Text("Tab 3")),
                  ],
                ),
              )

              // SliverList(
              //   delegate: SliverChildBuilderDelegate(
              //     (context, index) {
              //       return Column(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: const [
              //           TabBar(
              //             labelColor: Colors.white,
              //             unselectedLabelColor: Colors.white,
              //             indicatorColor: Colors.green,
              //             indicatorWeight: 4,
              //             tabs: [
              //               Text("About"),
              //               Text("Posts"),
              //               Text("Collections"),
              //             ],
              //           ),
              //           TabBarView(
              //             children: [
              //               Text("FIRST TAB"),
              //               Text("SECOND TAB"),
              //               Text("THIRD TAB"),
              //             ],
              //           )
              //         ],
              //       );
              //     },
              //     childCount: 1,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class tab_one extends StatelessWidget {
  const tab_one({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 40.0,
                height: 40.0,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fitHeight,
                    image: AssetImage('assets/boy1.png'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: const [
                            Text(
                              "names[index]",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "usernames[index]",
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.grey,
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 0.0, bottom: 8.0),
                      child: Text(
                        "tweets[index]",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset("assets/back1.jpg")),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 16, 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10.0,
                                width: 18.0,
                                child: IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  icon: const Icon(
                                    Icons.chat_bubble_outline,
                                    size: 18.0,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(
                                  height: 10.0,
                                  width: 18.0,
                                  child: Text(
                                    "replies[index]",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10.0,
                                width: 18.0,
                                child: IconButton(
                                  padding: const EdgeInsets.all(0.0),
                                  icon: const Icon(
                                    Icons.replay,
                                    size: 18.0,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                  height: 10.0,
                                  width: 18.0,
                                  child: Text(
                                    "retweets[index]",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10.0,
                                width: 18.0,
                                child: IconButton(
                                  padding: EdgeInsets.all(0.0),
                                  icon: Icon(
                                    Icons.favorite_border,
                                    size: 18.0,
                                    color: Colors.grey,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              SizedBox(
                                  height: 13.0,
                                  width: 22.0,
                                  child: Text(
                                    "23",
                                    style: TextStyle(color: Colors.grey),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10.0,
                            width: 10.0,
                            child: IconButton(
                              padding: new EdgeInsets.all(0.0),
                              icon: Icon(
                                Icons.share,
                                size: 18.0,
                                color: Colors.grey,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Container(
            width: double.infinity,
            color: Colors.grey,
            height: 0.5,
          ),
        )
      ],
    );
  }
}
