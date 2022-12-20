import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> authFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  RxBool isLoading = false.obs;
  RxBool isSignIn = false.obs;
  RxBool isTextHidden = true.obs;

  void toggleForm() {
    // log(isSignIn.value.toString());
    isSignIn.value = !isSignIn.value;
  }

  void togglePasswordText() {
    isTextHidden.value = !isTextHidden.value;
  }

  String? usernameValidation(String username) {
    if (username.isEmpty) {
      return "Username Can't be empty";
    } else if (!GetUtils.isUsername(username)) {
      return "It is not a valid username";
    }
    return null;
  }

  String? emailValidation(String email) {
    if (email.isEmpty) {
      return "Email Can't be empty";
    } else if (!GetUtils.isEmail(email)) {
      return "It is not a valid email";
    }
    return null;
  }

  String? passwordValidation(String password) {
    if (password.isEmpty) {
      return "Password Can't be empty";
    }
    return null;
  }

  bool validate() {
    final bool isValid = authFormKey.currentState!.validate();
    if (!isValid) {
      return false;
    }
    return isValid;
  }

  Future<void> login() async {
    if (validate()) {
      authFormKey.currentState!.save();
      log(emailController.text.toString());
      log(passwordController.text.toString());
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }

  void register() {
    validate();
  }
}
