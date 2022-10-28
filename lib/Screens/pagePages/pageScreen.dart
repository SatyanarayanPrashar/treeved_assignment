import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/colors.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/Screens/ProfilePages/collectionTab.dart';
import 'package:treeved_assignment/Screens/ProfilePages/postsTab.dart';
import 'package:treeved_assignment/Screens/ProfilePages/profile_header.dart';
import 'package:treeved_assignment/Screens/pagePages/pageHeader.dart';

class pageScreen extends StatelessWidget {
  const pageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Scaffold(
            body: Container(
              color: Colors.white,
              child: NestedScrollView(
                physics: const BouncingScrollPhysics(),
                floatHeaderSlivers: true,
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      collapsedHeight: 0,
                      expandedHeight: 310,
                      toolbarHeight: 0,
                      flexibleSpace: Page_Header(isUserProfile: false),
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
                            Tab(child: Text("Collections")),
                            Tab(child: Text("Posts")),
                          ],
                        ),
                      ),
                      pinned: true,
                    ),
                  ];
                },
                body: TabBarView(
                  children: [
                    CollectionTab(),
                    PostTab(),
                  ],
                ),
              ),
            ),
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
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Container(
      color: themeProvider.themeMode == ThemeMode.light
          ? Colors.white
          : TreeVedAppTheme.boxColorDark,
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
