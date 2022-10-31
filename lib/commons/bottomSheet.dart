import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/colors.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet(
      {Key? key, required this.childern, this.height, this.topdivider})
      : super(key: key);
  final List<Widget> childern;
  final height;
  final bool? topdivider;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);

    return Container(
      height: height ?? 0.4 * size.height,
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
          topdivider ?? true
              ? SizedBox(
                  height: 0.01 * size.height,
                )
              : Container(),
          topdivider ?? true
              ? Center(
                  child: Container(
                    height: 0.005 * size.height,
                    width: 0.2 * size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.grey.shade300,
                    ),
                  ),
                )
              : Container(),
          // SizedBox(
          //   height: 0.01 * size.height,
          // ),
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
