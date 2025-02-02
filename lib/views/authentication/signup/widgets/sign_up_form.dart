import 'package:flutter/material.dart';
import 'package:flutter_auth/controllers/sign_up_controller.dart';
import 'package:flutter_auth/widgets/custom_input.dart';

Column signUpForm(
    SignUpController controller, bool secure, Function() setState) {
  return Column(
    children: [
      CustomInputFelid(
        hint: "Business Name",
        controller: controller.nameTextController,
      ),
      CustomInputFelid(
        hint: "Email",
        controller: controller.emailController,
        keyboardType: TextInputType.emailAddress,
      ),
      CustomInputFelid(
        hint: "Password",
        controller: controller.passwordController,
      ),
      CustomInputFelid(
        hint: "conform password",
        controller: controller.conformPasswordController,
        isPassWord: true,
        secure: secure,
        lowerMargin: true,
        toggle: () {
          setState();
        },
      ),
    ],
  );
}
