import 'package:flutter/material.dart';

class FeedIcons extends StatefulWidget {
  const FeedIcons({
    Key? key,
    required this.label,
    required this.icon,
    this.likeCount,
    required this.screenSize,
    required this.onTap,
    this.color,
    this.height,
    this.width,
  }) : super(key: key);

  final String label;
  final IconData icon;
  final int? likeCount;
  final Color? color;
  final Size screenSize;
  final VoidCallback onTap;
  final height;
  final width;

  @override
  State<FeedIcons> createState() => _FeedIconsState();
}

class _FeedIconsState extends State<FeedIcons> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return InkWell(
      onTap: widget.onTap,
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: 0.03 * widget.screenSize.height,
              color: widget.color,
            ),
            SizedBox(
              height: 0.001 * widget.screenSize.height,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.likeCount?.toString() ?? '',
                    style: TextStyle(
                      fontSize: 0.014 * widget.screenSize.height,
                    )),
                SizedBox(
                  width: 0.01 * widget.screenSize.width,
                ),
                Text(
                  widget.label,
                  style: TextStyle(
                    fontSize: 0.0155 * widget.screenSize.height,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
