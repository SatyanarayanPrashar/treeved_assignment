import 'package:flutter/material.dart';
import 'package:treeved_assignment/Screens/AuthPages/authButtons.dart';
import 'package:treeved_assignment/Screens/AuthPages/textField.dart';
import 'package:treeved_assignment/Screens/AuthPages/loginpage.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextEditingController usernameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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
              Text_Field(
                title: 'Username',
                inputcontroller: usernameController,
                fieldicon: const Icon(Icons.person_outline),
              ),
              Text_Field(
                title: 'Email',
                inputcontroller: emailController,
                fieldicon: const Icon(Icons.email_outlined),
              ),
              Text_Field(
                title: 'Password',
                inputcontroller: passwordController,
                fieldicon: const Icon(Icons.lock_outline_rounded),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(11, 11, 11, 17),
                child: ElevatedButton(
                  onPressed: () {
                    //
                  },
                  child: SizedBox(
                    height: 45,
                    width: size.width,
                    child: const Center(
                      child: Text(
                        "Sign Up",
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
              const SizedBox(height: 30),
              const Text("Already have a TreeVed account?"),
              InkWell(
                onTap: () {
                  //
                  print("to login page");
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return LoginPage();
                  }));
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue,
                    letterSpacing: 1,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Text("By creating an account you are agreeing to our"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      //
                    },
                    child: Text(
                      "Terms and Contitions",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                  const Text(" and "),
                  InkWell(
                    onTap: () {
                      //
                    },
                    child: Text(
                      "Privacy Policy",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
