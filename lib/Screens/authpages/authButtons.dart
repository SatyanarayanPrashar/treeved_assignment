import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.buttonLogo, required this.route});
  final String buttonLogo;
  final VoidCallback route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: route,
        child: Image.asset(
          buttonLogo,
          height: 80,
        ));
  }
}
