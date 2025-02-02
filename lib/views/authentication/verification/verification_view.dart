import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_auth/constants/image_constants.dart';
import 'package:flutter_auth/constants/size_constants.dart';
import 'package:flutter_auth/controllers/verify_otp_controller.dart';
import 'package:flutter_auth/helper/dialog_helper.dart';
import 'package:flutter_auth/utils/dimension.dart';
import 'package:flutter_auth/views/authentication/new_password/new_password.dart';
import 'package:flutter_auth/views/authentication/verification/widgets/otp_field.dart';
import 'package:flutter_auth/views/authentication/widget/auth_header.dart';
import 'package:flutter_auth/widgets/custom_button.dart';
import 'package:flutter_auth/widgets/fancy2_text.dart';

class VerificationView extends StatelessWidget {
  const VerificationView({super.key, this.email});
  static const routeName = "/verification-otp";

  static final VerifyOtpController _verifyOtpController =
      Get.put(VerifyOtpController());

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(AppSizes.defaultPadding),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                context.spacing(height: 10),
                Image.asset(
                  AppImages.verificationImage,
                  width: context.getWidth(65),
                ),
                const SizedBox(height: 25),
                const AuthHeader(
                  title: "Verification",
                  subTitle: "An OTP  has been send to your email",
                ),
                const SizedBox(height: 40),
                const OtpFelid(),
                const SizedBox(height: 50),
                Obx(() {
                  return CustomButton(
                    label: "Verify",
                    isLoading: _verifyOtpController.loading,
                    onTap: () {
                      _verifyOtpController.verify(email, (status) {
                        if (status) {
                          Get.to(NewPassWordView(email: email));
                        } else {
                          DialogHelper.showSnackBar();
                        }
                      });
                      // return Navigator.of(context)
                      //   .pushNamed(NewPassWordView.routeName);
                    },
                  );
                }),
                const SizedBox(height: 15),
                const Fancy2Text(
                  first: "Didn’t received OTP? ",
                  second: " Resent",
                  isCenter: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
