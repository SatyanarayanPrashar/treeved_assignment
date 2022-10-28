import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/colors.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({Key? key, required this.childern, this.height})
      : super(key: key);
  final List<Widget> childern;
  final height;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);

    return Container(
      height: height ?? 0.3 * size.height,
      width: size.longestSide,
      decoration: BoxDecoration(
        color: themeProvider.themeMode == ThemeMode.light
            ? Colors.white
            : Color.fromARGB(255, 57, 60, 72),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 0.01 * size.height,
          ),
          Center(
            child: Container(
              height: 0.005 * size.height,
              width: 0.2 * size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.grey.shade300,
              ),
            ),
          ),
          SizedBox(
            height: 0.01 * size.height,
          ),
          Expanded(
            child: Container(
                margin: const EdgeInsets.all(10),
                child: Column(children: childern)),
          )
        ],
      ),
    );
  }
}
