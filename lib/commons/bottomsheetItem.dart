import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';

class BottomSheetItems extends StatelessWidget {
  const BottomSheetItems({
    Key? key,
    required this.onTap,
    required this.title,
    this.color,
  }) : super(key: key);

  final void Function() onTap;
  final String title;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: true);

    return Material(
      color: themeProvider.themeMode == ThemeMode.light
          ? Colors.white
          : Color.fromARGB(255, 57, 60, 72),
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 45,
          padding: const EdgeInsets.symmetric(horizontal: 11),
          child: Row(
            children: [
              Text(
                title,
                style: TextStyle(
                  color: title == "Block" ||
                          title == "Delete" ||
                          title == "Log Out"
                      ? Colors.red
                      : color ?? Theme.of(context).iconTheme.color,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
