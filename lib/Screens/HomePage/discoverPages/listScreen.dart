import 'package:flutter/material.dart';
import 'package:treeved_assignment/commons/listTab.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) => ListTabs(),
      ),
    );
  }
}
