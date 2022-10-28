import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/AuthPages/textField.dart';
import 'package:treeved_assignment/commons/commonTextField.dart';
import 'package:treeved_assignment/package/treevedIcon/treeved_icons_icons.dart';

class channelChatScreen extends StatelessWidget {
  const channelChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController messageController = TextEditingController();

    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                Flexible(
                  child: SizedBox(
                    width: size.width * 0.4,
                    child: Text(
                      "Photography Club",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(11, 7, 7, 7),
                  decoration: BoxDecoration(
                    color: Color(0xffEFF3FB),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    "Discussion",
                    style: TextStyle(
                      fontSize: 11,
                      color: Color(0xff658AC7),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    //
                  },
                  icon: Icon(TreevedIcons.discover)),
            ],
          ),
          body: Column(
            children: [
              // chats StremBuilder will be placed in this Expanded
              Expanded(
                  child: Container(
                height: size.height,
              )),
              Row(
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 11, right: 11, bottom: 11),
                      child: Material(
                        elevation: 10,
                        shadowColor: Colors.black.withOpacity(0.5),
                        child: TextField(
                          controller: messageController,
                          decoration: InputDecoration(
                            hintText: "Message",
                            hintStyle: const TextStyle(
                                color: Colors.grey, fontSize: 14),
                            fillColor: Colors.white,
                            filled: true,
                            contentPadding: const EdgeInsets.fromLTRB(
                                10.0, 10.0, 20.0, 10.0),
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.6),
                                  width: 1),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 11, 11),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(11)),
                      child: IconButton(
                          onPressed: () {
//
                          },
                          icon: const Icon(
                            Icons.send,
                            color: Colors.white,
                          )),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
