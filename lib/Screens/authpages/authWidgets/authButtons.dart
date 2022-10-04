import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({super.key, required this.buttonLogo, required this.route});
  final String buttonLogo;
  final VoidCallback route;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: route,
      child: Container(
        height: 54,
        width: 54,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5)
          ],
        ),
        child: Image(
          image: AssetImage(buttonLogo),
        ),
      ),
    );
  }
}
