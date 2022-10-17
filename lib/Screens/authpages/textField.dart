import 'package:flutter/material.dart';

class Text_Field extends StatelessWidget {
  const Text_Field(
      {super.key,
      required this.title,
      required this.inputcontroller,
      required this.fieldicon});

  final String title;
  final TextEditingController inputcontroller;
  final Icon fieldicon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 11, bottom: 7),
              child: Text(
                title,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.blue),
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
              decoration: InputDecoration(
                prefixIcon: fieldicon,
                hintText: 'Enter your $title',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                fillColor: Colors.white,
                filled: true,
                contentPadding:
                    const EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: const BorderSide(color: Colors.white, width: 3.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
