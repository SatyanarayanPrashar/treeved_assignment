import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/colors.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/Screens/GroupPages/groupScreen.dart';
import 'package:treeved_assignment/commons/bottomSheet.dart';
import 'package:treeved_assignment/commons/bottomsheetItem.dart';
import 'package:treeved_assignment/commons/settingsBottomSheet.dart';

class Profile_Header extends StatefulWidget {
  final bool isUserProfile;

  const Profile_Header({
    Key? key,
    required this.isUserProfile,
  }) : super(key: key);

  @override
  State<Profile_Header> createState() => _Profile_HeaderState();
}

class _Profile_HeaderState extends State<Profile_Header> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Flexible(
          flex: 3,
          child: Container(
            height: 300,
            decoration: BoxDecoration(
              // color: Colors.redAccent,
              border: Border(
                  bottom: BorderSide(color: Colors.black.withOpacity(0.2))),
            ),
            child: Column(
              children: [
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        !widget.isUserProfile
                            ? Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: InkWell(
                                  onTap: () {
                                    print("tapped");
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                  ),
                                ),
                              )
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.transparent,
                                  builder: (context) {
                                    return settingsBottomsheet(
                                        isUserProfile: widget.isUserProfile);
                                  });
                            },
                            icon: const Icon(Icons.menu),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Flexible(
                    flex: 7,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 18),
                      child: CircleAvatar(
                        radius: 55,
                        child: CircleAvatar(
                          radius: 100,
                          backgroundImage: AssetImage("assets/boy1.png"),
                        ),
                      ),
                    )),
                const Flexible(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.only(top: 11, bottom: 4.0),
                    child: Text(
                      'Satya Don',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                const Flexible(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: 4.0),
                    child: Text(
                      '@Satya_Don',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Entrepreneur  ',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                        Container(
                          height: 7,
                          width: 7,
                          decoration: const BoxDecoration(
                              color: Colors.grey, shape: BoxShape.circle),
                        ),
                        const Text(
                          '  244',
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: Colors.grey),
                        ),
                        const Text(
                          ' connections',
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: widget.isUserProfile
                        ? InkWell(
                            onTap: () {
                              //
                              print("tapped");
                            },
                            child: Container(
                              height: 32,
                              width: 105,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.2),
                                        spreadRadius: 1,
                                        blurRadius: 5)
                                  ]),
                              child: const Center(
                                child: Text(
                                  "  Edit Profie  ",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  //
                                },
                                child: Container(
                                  height: 32,
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: TreeVedAppTheme.primaryColor,
                                      borderRadius: BorderRadius.circular(4),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 5)
                                      ]),
                                  child: const Center(
                                    child: Text(
                                      "  Connect  ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.02),
                              InkWell(
                                onTap: () {
                                  //
                                },
                                child: Container(
                                  height: 32,
                                  width: size.width * 0.4,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(4),
                                      boxShadow: [
                                        BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.2),
                                            spreadRadius: 1,
                                            blurRadius: 5)
                                      ]),
                                  child: const Center(
                                    child: Text(
                                      "  Recommend  ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.02),
                              InkWell(
                                  onTap: () {},
                                  child: Icon(
                                    Icons.more_vert,
                                  ))
                            ],
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class group_section extends StatelessWidget {
  const group_section({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Container(
      height: 120,
      decoration: BoxDecoration(
        border:
            Border(bottom: BorderSide(color: Colors.black.withOpacity(0.2))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              itemCount: 6,
              itemBuilder: (context, index) {
                return index == 0
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: CircleAvatar(
                                radius: 24,
                                child: CircleAvatar(
                                  radius: 23,
                                  backgroundColor:
                                      themeProvider.themeMode == ThemeMode.light
                                          ? Colors.white
                                          : Color(0xffEFF3FB),
                                  child: Icon(Icons.add),
                                ),
                              ),
                            ),
                            const Flexible(
                              child: Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text(
                                  "New Group",
                                  style: TextStyle(
                                      fontSize: 11, color: Colors.blue),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => groupPage()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Flexible(
                                child: CircleAvatar(
                                  radius: 24,
                                  backgroundImage:
                                      AssetImage("assets/back1.jpg"),
                                ),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Container(
                                    width: 52,
                                    child: const Text(
                                      "Flim and Cinema",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 11),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
              },
            ),
          ),
        ],
      ),
    );
  }
}
