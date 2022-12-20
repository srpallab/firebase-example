import 'package:firebase_example/core/utils/theme.dart';
import 'package:firebase_example/screens/email_pass_screen.dart';
import 'package:firebase_example/widgets/auth_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(title: "Firebase Demo", body: body(context));
  }

  void gotoAuthPage() {
    Get.to(() => const EmailPassScreen());
  }

  SizedBox body(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          headerSection(),
          const SizedBox(height: 20),
          AuthButton(
            onPressed: gotoAuthPage,
            text: "Login With Email",
            iconData: Icons.email_outlined,
          ),
        ],
      ),
    );
  }

  Text headerSection() {
    return const Text(
      "Choose Your Authentication Method",
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
