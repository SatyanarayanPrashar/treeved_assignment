import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/AuthPages/authWidgets/textField.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController emailController = TextEditingController();

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            "Forgot Password",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
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
            Padding(
              padding: const EdgeInsets.all(11),
              child: Text(
                  "Enter your email to set a new password for your account so  you can login and access all the features",
                  style: TextStyle(fontSize: 15)),
            ),
            Text_Field(
              title: "Email",
              inputcontroller: emailController,
              fieldicon: Icon(Icons.email),
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
