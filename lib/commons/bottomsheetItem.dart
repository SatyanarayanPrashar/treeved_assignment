import 'package:flutter/material.dart';

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
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
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
                  color: title == "Block" || title == "Delete"
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
