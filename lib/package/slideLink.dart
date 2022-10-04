import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/discoverPages/WidgetpeopleScreen.dart';
import 'package:treeved_assignment/package/slidable_links/slidable.dart';
import 'slidable_links/action_pane_motions.dart';
import 'slidable_links/actions.dart';

class SlideLink extends StatefulWidget {
  const SlideLink({super.key});

  @override
  State<SlideLink> createState() => _SlideLinkState();
}

class _SlideLinkState extends State<SlideLink> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) => {
              //
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Actionmessage(
                  message: 'Link added to list!',
                ),
                duration: Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                elevation: 0,
                backgroundColor: Colors.transparent,
              ))
            },
            icon: Icons.list,
            label: "Add to List",
            backgroundColor: const Color.fromARGB(255, 211, 231, 244),
          ),
          // Slid
        ],
      ),
      endActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              //
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Actionmessage(
                  message: 'Link added to Diary!',
                ),
                duration: Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                elevation: 0,
                backgroundColor: Colors.transparent,
              ));
            },
            icon: Icons.book_outlined,
            label: "Add to Diary",
            backgroundColor: Color.fromARGB(255, 211, 231, 244),
          ),
        ],
      ),
      child: MovieListTab(),
    );
  }
}

class Actionmessage extends StatelessWidget {
  const Actionmessage({super.key, required this.message});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 211, 231, 244),
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 173, 173, 173),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: const TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const Icon(
            Icons.done,
            color: Colors.green,
          )
        ],
      )),
    );
  }
}
