import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_auth/constants/image_constants.dart';
import 'package:flutter_auth/constants/size_constants.dart';
import 'package:flutter_auth/controllers/reset_password_controller.dart';
import 'package:flutter_auth/helper/dialog_helper.dart';
import 'package:flutter_auth/utils/dimension.dart';
import 'package:flutter_auth/views/authentication/login/login_view.dart';
import 'package:flutter_auth/views/authentication/widget/auth_header.dart';
import 'package:flutter_auth/widgets/custom_button.dart';
import 'package:flutter_auth/widgets/custom_input.dart';

class NewPassWordView extends StatefulWidget {
  const NewPassWordView({super.key, this.email});
  static const routeName = "/newPassword";
  final String? email;

  @override
  State<NewPassWordView> createState() => _NewPassWordViewState();
}

class _NewPassWordViewState extends State<NewPassWordView> {
  bool isSecure = false;
  final ResetPassWordController _resetPassWordController =
      Get.put(ResetPassWordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              context.spacing(height: 10),
              Image.asset(
                AppImages.newPass,
                width: context.getWidth(65),
              ),
              const SizedBox(height: 50),
              const AuthHeader(
                title: "New Password",
                subTitle: "Enter new password",
              ),
              const SizedBox(height: 40),
              CustomInputFelid(
                hint: "New password",
                lowerMargin: true,
                controller: _resetPassWordController.passwordController,
              ),
              CustomInputFelid(
                hint: "Conform password",
                keyboardType: TextInputType.emailAddress,
                isPassWord: true,
                secure: isSecure,
                controller: _resetPassWordController.conformPasswordController,
                toggle: () {
                  setState(() {
                    isSecure = !isSecure;
                  });
                },
              ),
              Obx(() {
                return CustomButton(
                  label: "Submit",
                  isLoading: _resetPassWordController.loading,
                  onTap: () => _resetPassWordController
                      .resetPassword(widget.email, (status) {
                    if (status) {
                      Get.toNamed(LoginView.routeName);
                      DialogHelper.showSnackBar(
                          title: "Done 😎",
                          description: "password successfully changed");
                    } else {
                      DialogHelper.showSnackBar();
                    }
                  }),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
