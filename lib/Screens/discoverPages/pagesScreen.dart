import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/discoverPages/WidgetpeopleScreen.dart';

class PagesScreen extends StatelessWidget {
  const PagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(11),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 180,
            mainAxisSpacing: 11,
            mainAxisExtent: 217,
          ),
          itemCount: 18,
          itemBuilder: (context, index) {
            return Pagestabs(
                name: "Photography",
                imageDes: "assets/boy1.png",
                bgimage: "assets/back1.jpg");
          },
        ),
      ),
    );
  }
}
