import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/AuthPages/textField.dart';
import 'package:treeved_assignment/commons/commonTextField.dart';

class createList extends StatelessWidget {
  const createList({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController noteController = TextEditingController();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
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
            commonTextField(
              inputcontroller: noteController,
              title: "Add a note",
              hint: "Add a description",
              maxLine: 6,
            ),
            const Padding(
              padding: EdgeInsets.all(11),
              child: Text(
                "Select Collection",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: Color(0xff385585)),
              ),
            ),
            Container(
              height: 270,
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(
                  top: 0.02 * size.width,
                  left: 0.03 * size.width,
                  right: 0.03 * size.width,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 17,
                  mainAxisSpacing: 17,
                  mainAxisExtent: 40,
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
                    "Create List",
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
