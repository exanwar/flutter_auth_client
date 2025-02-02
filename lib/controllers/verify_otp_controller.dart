import 'package:get/get.dart';
import 'package:flutter_auth/controllers/base_controller.dart';
import 'package:flutter_auth/services/base/app_exceptions.dart';

import '../services/auth_service.dart';

class VerifyOtpController extends GetxController implements BaseController {
  final AuthService _authService = AuthService();

  String? otp = "";
  final _loading = false.obs;

  // set otp(otp) => _otp = otp;
  bool get loading => _loading.value;

  void onChange(val) {
    otp = val;
  }

  bool validate() {
    try {
      if (otp!.isEmpty) {
        throw InvalidException("please fill correct OTP", false);
      } else if (otp!.length < 4) {
        throw InvalidException("OTP must be 4 digits", false);
      } else {
        return true;
      }
    } catch (e) {
      handleError(e);
      return false;
    }
  }

  void verify(String? email, Function(bool)? success) async {
    bool valid = validate();

    if (valid) {
      _loading.value = true;
      await Future.delayed(const Duration(seconds: 2));

      // ? login method
      bool status = await _authService.verifyOtp(
        {
          "email": email.toString(),
          "otp": otp.toString(),
        },
      );
      _loading.value = false;
      await Future.delayed(const Duration(milliseconds: 300));
      success!(status);
    }
  }

  @override
  void handleError(error) {
    // TODO: implement handleError
  }
}
