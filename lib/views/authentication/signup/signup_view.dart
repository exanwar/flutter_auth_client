import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_auth/constants/color_constants.dart';
import 'package:flutter_auth/constants/size_constants.dart';
import 'package:flutter_auth/controllers/sign_up_controller.dart';
import 'package:flutter_auth/helper/dialog_helper.dart';
import 'package:flutter_auth/utils/dimension.dart';
import 'package:flutter_auth/views/authentication/login/login_view.dart';
import 'package:flutter_auth/views/authentication/signup/widgets/sign_up_form.dart';
import 'package:flutter_auth/views/authentication/widget/auth_header.dart';
import 'package:flutter_auth/views/home/home_view.dart';
import 'package:flutter_auth/widgets/custom_button.dart';
import 'package:flutter_auth/widgets/fancy2_text.dart';
import 'package:flutter_auth/widgets/social_media_log.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});
  static const routeName = '/sign-up';

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final SignUpController _signUpController = Get.put(SignUpController());
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
                    subTitle: "Create an account",
                    title: "Sign Up",
                  ),
                  const SizedBox(height: 50),
                  signUpForm(
                    _signUpController,
                    secure,
                    () => setState(() {
                      secure = !secure;
                    }),
                  ),
                  const SizedBox(height: 32),
                  Obx(() {
                    return CustomButton(
                        label: "Sign Up",
                        isLoading: _signUpController.loading,
                        onTap: () async {
                          await _signUpController.register(
                            (status) {
                              if (status) {
                                Get.offNamedUntil(
                                  HomeView.routeName,
                                  (_) => false,
                                );
                              } else {
                                DialogHelper.showSnackBar();
                              }
                            },
                          );
                        });
                  }),
                  const SizedBox(height: 15),
                  Fancy2Text(
                    first: "Already have an account? ",
                    second: " Login",
                    isCenter: true,
                    onTap: () => Navigator.pushNamed(
                      context,
                      LoginView.routeName,
                    ),
                  ),
                  const SizedBox(height: 50),
                  SocialMediaAuthArea(),
                  const SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
