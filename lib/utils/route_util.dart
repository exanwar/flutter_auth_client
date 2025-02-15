import 'package:flutter/material.dart';
import 'package:flutter_auth/views/authentication/forgot/forgot_password.dart';
import 'package:flutter_auth/views/authentication/login/login_view.dart';
import 'package:flutter_auth/views/authentication/new_password/new_password.dart';
import 'package:flutter_auth/views/authentication/select_auth/select_auth_view.dart';
import 'package:flutter_auth/views/authentication/signup/signup_view.dart';
import 'package:flutter_auth/views/authentication/verification/verification_view.dart';
import 'package:flutter_auth/views/home/home_view.dart';
import 'package:flutter_auth/views/onboarding/onboarding_view.dart';
import 'package:flutter_auth/views/splash/splash_view.dart';

class RouteUtil {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashView.routeName:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case OnboardingView.routeName:
        return MaterialPageRoute(builder: (context) => const OnboardingView());
      case SelectAuthView.routeName:
        return MaterialPageRoute(builder: (context) => const SelectAuthView());
      case SignUpView.routeName:
        return MaterialPageRoute(builder: (context) => const SignUpView());
      case LoginView.routeName:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case ForgotPassWord.routeName:
        return MaterialPageRoute(builder: (context) => const ForgotPassWord());
      case VerificationView.routeName:
        return MaterialPageRoute(
            builder: (context) => const VerificationView());
      case HomeView.routeName:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case NewPassWordView.routeName:
        return MaterialPageRoute(builder: (context) => const NewPassWordView());
      default:
        return MaterialPageRoute(builder: (context) => const Scaffold());
    }
  }
}
