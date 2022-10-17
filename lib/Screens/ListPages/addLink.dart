import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/AuthPages/textField.dart';
import 'package:treeved_assignment/commons/commonTextField.dart';

class addLink extends StatefulWidget {
  const addLink({super.key});

  @override
  State<addLink> createState() => _addLinkState();
}

class _addLinkState extends State<addLink> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController noteController = TextEditingController();

    bool resourceExpanded = false;

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: const Text(
          "Create list",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.05),
            commonTextField(
              inputcontroller: nameController,
              title: "List name",
              hint: "Name of your list",
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 21),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 11),
                    child: InkWell(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(11, 7, 11, 7),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.done,
                              size: 17,
                            ),
                            Text(
                              "   Completed",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 11),
                    child: InkWell(
                      child: Container(
                        padding: EdgeInsets.fromLTRB(11, 7, 11, 7),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.bookmark_outline_rounded,
                              size: 17,
                            ),
                            Text(
                              "   Save for later",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(11),
              child: Text(
                "Rating",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Color(0xff385585)),
              ),
            ),
            commonTextField(
              inputcontroller: noteController,
              title: "Add a note",
              hint: "Add a description",
              maxLine: 6,
            ),
            const Padding(
              padding: EdgeInsets.all(11),
              child: Text(
                "Resource type",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Color(0xff385585)),
              ),
            ),
            AnimatedContainer(
              height: resourceExpanded ? 100 : 200,
              duration: Duration(milliseconds: 400),
              child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.only(
                  top: 0.02 * size.width,
                  left: 0.03 * size.width,
                  right: 0.03 * size.width,
                ),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  // crossAxisCount: 2,
                  crossAxisSpacing: 17,
                  mainAxisSpacing: 17,
                  mainAxisExtent: 40, maxCrossAxisExtent: size.width * 0.4,
                ),
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(color: Colors.grey.withOpacity(0.3)),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(255, 223, 223, 223),
                          blurRadius: 5,
                          spreadRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Row(
                        children: [
                          Container(
                            width: 10,
                            height: size.height * 0.027,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(2)),
                          ),
                          const Flexible(
                            child: Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                "Must watch movies",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 14),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(11),
              child: InkWell(
                onTap: () {
                  // create list function here
                },
                child: Container(
                  height: 47,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4)),
                  child: const Center(
                      child: Text(
                    "Select List",
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
