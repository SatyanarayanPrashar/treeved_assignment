import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';
import 'package:treeved_assignment/Screens/groupPages/groupScreen.dart';

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
