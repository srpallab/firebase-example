import 'package:firebase_example/controllers/auth_controller.dart';
import 'package:firebase_example/core/utils/theme.dart';
import 'package:firebase_example/widgets/auth_button.dart';
import 'package:firebase_example/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmailPassScreen extends StatelessWidget {
  const EmailPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainLayout(
      body: GetX<AuthController>(
        init: AuthController(),
        builder: (controller) {
          return Form(
            key: controller.authFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                if (controller.isSignIn.value)
                  CustomTextFormField(
                    textEditingController: controller.usernameController,
                    validator: controller.usernameValidation,
                    label: "Username",
                    iconData: Icons.person,
                    suffixButton: null,
                    hideText: false,
                    textInputType: TextInputType.text,
                  ),
                CustomTextFormField(
                  textEditingController: controller.emailController,
                  validator: controller.emailValidation,
                  label: "Email",
                  iconData: Icons.email,
                  suffixButton: null,
                  hideText: false,
                  textInputType: TextInputType.emailAddress,
                ),
                CustomTextFormField(
                  textEditingController: controller.passwordController,
                  validator: controller.passwordValidation,
                  label: "Password",
                  iconData: Icons.password,
                  suffixButton: IconButton(
                    icon: controller.isTextHidden.value
                        ? const Icon(Icons.visibility_off)
                        : const Icon(Icons.visibility),
                    onPressed: () {
                      controller.togglePasswordText();
                    },
                  ),
                  hideText: controller.isTextHidden.value,
                  textInputType: TextInputType.text,
                ),
                controller.isLoading.value
                    ? const CircularProgressIndicator()
                    : controller.isSignIn.value
                        ? AuthButton(
                            onPressed: () {},
                            text: "Register",
                            iconData: Icons.login,
                          )
                        : AuthButton(
                            onPressed: () {
                              controller.login();
                            },
                            text: " Login",
                            iconData: Icons.login,
                          ),
                const SizedBox(height: 10),
                controller.isSignIn.value
                    ? TextButton(
                        onPressed: () {
                          controller.toggleForm();
                        },
                        child: const Text("Or Already have an Account."),
                      )
                    : TextButton(
                        onPressed: () {
                          controller.toggleForm();
                        },
                        child: const Text("Or Register a New Account."),
                      ),
              ],
            ),
          );
        },
      ),
      title: "Email Password Login",
    );
  }
}
