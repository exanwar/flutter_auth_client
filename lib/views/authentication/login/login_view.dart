import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:flutter_auth/constants/color_constants.dart';
import 'package:flutter_auth/constants/size_constants.dart';
import 'package:flutter_auth/controllers/login_controller.dart';
import 'package:flutter_auth/helper/dialog_helper.dart';
import 'package:flutter_auth/utils/dimension.dart';
import 'package:flutter_auth/views/authentication/forgot/forgot_password.dart';
import 'package:flutter_auth/views/authentication/signup/signup_view.dart';
import 'package:flutter_auth/views/authentication/widget/auth_header.dart';
import 'package:flutter_auth/views/home/home_view.dart';
import 'package:flutter_auth/widgets/custom_button.dart';
import 'package:flutter_auth/widgets/custom_input.dart';
import 'package:flutter_auth/widgets/fancy2_text.dart';
import 'package:flutter_auth/widgets/social_media_log.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static const routeName = '/login';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController _loginController = LoginController();
  bool secure = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.defaultPadding,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  context.spacing(height: 5),
                  const AuthHeader(
                    subTitle: "Sign In To Your Account",
                    title: "Sign In",
                  ),
                  const SizedBox(height: 50),
                  _loginForm(_loginController),
                  Fancy2Text(
                    first: "Forgot password? ",
                    second: "Reset",
                    onTap: () =>
                        Navigator.pushNamed(context, ForgotPassWord.routeName),
                  ),
                  const SizedBox(height: 32),
                  Obx(() {
                    return CustomButton(
                      label: "Sign In",
                      isLoading: _loginController.loading,
                      onTap: () => _loginController.login((bool status) {
                        if (status) {
                          Get.offNamedUntil(
                            HomeView.routeName,
                            (_) => false,
                          );
                        } else {
                          DialogHelper.showSnackBar();
                        }
                      }),
                    );
                  }),
                  const SizedBox(height: 15),
                  Fancy2Text(
                    first: "Don’t have an account? ",
                    second: " Sign Up",
                    isCenter: true,
                    onTap: () =>
                        Navigator.pushNamed(context, SignUpView.routeName),
                  ),
                  const SizedBox(height: 50),
                  SocialMediaAuthArea()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Form _loginForm(LoginController controller) {
    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          CustomInputFelid(
            hint: "Business Name",
            controller: controller.nameTextController,
          ),
          CustomInputFelid(
            hint: "Email",
            keyboardType: TextInputType.emailAddress,
            controller: controller.emailController,
          ),
          CustomInputFelid(
            hint: "Password",
            isPassWord: true,
            secure: secure,
            lowerMargin: true,
            controller: controller.passwordController,
            toggle: () {
              setState(() {
                secure = !secure;
              });
            },
          ),
        ],
      ),
    );
  }
}
