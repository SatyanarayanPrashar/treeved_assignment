import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treeved_assignment/Constants/colors.dart';
import 'package:treeved_assignment/Constants/notifiers/themes_providers.dart';

class commonTextField extends StatelessWidget {
  const commonTextField(
      {super.key,
      this.title,
      required this.inputcontroller,
      this.fieldicon,
      this.hint,
      this.maxLine});

  final String? title;
  final String? hint;
  final int? maxLine;
  final TextEditingController inputcontroller;
  final Icon? fieldicon;

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider =
        Provider.of<ThemeProvider>(context, listen: false);

    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 11, bottom: 7),
              child: Text(
                title ?? "",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Color(0xff385585)),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 11, right: 11, bottom: 20),
          child: Material(
            elevation: 10,
            shadowColor: Colors.black.withOpacity(0.5),
            child: TextField(
              controller: inputcontroller,
              maxLines: maxLine,
              decoration: InputDecoration(
                prefix: fieldicon,
                hintText: hint ?? 'Enter $title',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                fillColor: themeProvider.themeMode == ThemeMode.light
                    ? Colors.white
                    : TreeVedAppTheme.boxColorDark.withOpacity(0.4),
                filled: true,
                contentPadding:
                    const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(
                      color: themeProvider.themeMode == ThemeMode.light
                          ? Colors.white
                          : TreeVedAppTheme.boxBorderdark,
                      width: 3.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
