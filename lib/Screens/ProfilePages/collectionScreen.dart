import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/HomePage/discoverPages/WidgetpeopleScreen.dart';
import 'package:treeved_assignment/Screens/ListPages/createList.dart';
import 'package:treeved_assignment/commons/listTab.dart';

class collectionScreen extends StatelessWidget {
  const collectionScreen(
      {super.key, this.isUserCollection, this.collectionName});

  final bool? isUserCollection;
  final String? collectionName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          collectionName ?? "Collection",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return createList();
          }));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Icon(Icons.add),
      ),
      body: Container(
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 4,
          itemBuilder: (context, index) {
            return ListTabs(isUserList: isUserCollection);
          },
        ),
      ),
    );
  }
}
