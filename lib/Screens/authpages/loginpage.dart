import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/AuthPages/authButtons.dart';
import 'package:treeved_assignment/Screens/AuthPages/textField.dart';
import 'package:treeved_assignment/Screens/AuthPages/forgotPgoogle.dart';
import 'package:treeved_assignment/Screens/AuthPages/forgotPpage.dart';
import 'package:treeved_assignment/Screens/AuthPages/signuppage.dart';
import 'package:treeved_assignment/Screens/HomePage/homePage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.07),
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
            Text_Field(
              title: 'Username',
              inputcontroller: usernameController,
              fieldicon: const Icon(Icons.person_outline),
            ),
            Text_Field(
              title: 'Password',
              inputcontroller: passwordController,
              fieldicon: const Icon(Icons.lock_outline_rounded),
            ),
            Padding(
              padding: const EdgeInsets.all(11),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                },
                child: SizedBox(
                  height: 45,
                  width: size.width,
                  child: const Center(
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 17,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              // crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AuthButton(
                  buttonLogo: 'assets/Icons/googleLogo.png',
                  route: () {
                    //
                  },
                ),
                const SizedBox(width: 20),
                AuthButton(
                  buttonLogo: 'assets/Icons/appleLogo.png',
                  route: () {
                    //
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: TextButton(
                onPressed: () {
                  log("to forgot password page");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ForgotPgooglePage();
                  }));
                },
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(letterSpacing: 0.7),
                ),
              ),
            ),
            const SizedBox(height: 90),
            const Text("Don't have a TreeVed account?"),
            InkWell(
              onTap: () {
                log("to signup page");
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignupPage();
                }));
              },
              child: const Text(
                "SignUp",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                  letterSpacing: 1,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
