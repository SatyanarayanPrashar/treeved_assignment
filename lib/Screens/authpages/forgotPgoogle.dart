import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/AuthPages/textField.dart';

class ForgotPgooglePage extends StatelessWidget {
  const ForgotPgooglePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController usernameController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Forgot Password",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: Column(
          children: [
            Row(),
            SizedBox(height: size.height * 0.03),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 57.0,
                backgroundColor: Colors.blue,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.transparent,
                  backgroundImage: AssetImage("assets/Icons/treeved.png"),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 18.0),
              child: Text(
                "TreeVed",
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 3,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Text_Field(
              title: "Username",
              inputcontroller: usernameController,
              fieldicon: Icon(Icons.person_outline),
            ),
            Padding(
              padding: const EdgeInsets.all(11),
              child: ElevatedButton(
                onPressed: () {
                  //
                },
                child: SizedBox(
                  height: 45,
                  width: size.width,
                  child: const Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
