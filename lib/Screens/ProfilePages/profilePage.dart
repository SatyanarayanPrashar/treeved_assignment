import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/HomePage/Feedpage/FeedScreen.dart';
import 'package:treeved_assignment/Screens/ProfilePages/aboutTab.dart';
import 'package:treeved_assignment/Screens/ProfilePages/collectionTab.dart';
import 'package:treeved_assignment/Screens/ProfilePages/postsTab.dart';
import 'package:treeved_assignment/Screens/ProfilePages/profile_header.dart';

class ProfilePage extends StatefulWidget {
  final bool isUserProfile;
  const ProfilePage({super.key, required this.isUserProfile});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Container(
            color: Colors.white,
            child: NestedScrollView(
                physics: const BouncingScrollPhysics(),
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar.large(
                      // automaticallyImplyLeading: !widget.isUserProfile,
                      collapsedHeight: 0,
                      expandedHeight: 300,
                      toolbarHeight: 0,
                      backgroundColor: Colors.white,
                      flexibleSpace:
                          Profile_Header(isUserProfile: widget.isUserProfile),
                    ),
                    const SliverAppBar(
                      expandedHeight: 80,
                      collapsedHeight: 0,
                      backgroundColor: Colors.transparent,
                      toolbarHeight: 0,
                      flexibleSpace: group_section(),
                    ),
                    SliverPersistentHeader(
                      delegate: _SliverAppBarDelegate(
                        const TabBar(
                          unselectedLabelColor: Colors.grey,
                          unselectedLabelStyle:
                              TextStyle(fontWeight: FontWeight.w400),
                          labelColor: Colors.blue,
                          labelStyle: TextStyle(fontWeight: FontWeight.bold),
                          tabs: [
                            Tab(child: Text("About")),
                            Tab(child: Text("Collections")),
                            Tab(child: Text("Posts"))
                          ],
                        ),
                      ),
                      pinned: true,
                    ),
                  ];
                },
                body: const TabBarView(children: [
                  AboutTab(),
                  CollectionTab(),
                  PostTab(),
                ])),
          ),
        ),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
