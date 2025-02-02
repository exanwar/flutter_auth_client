import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_auth/theme/theme.dart';
import 'package:flutter_auth/utils/route_util.dart';
import 'package:flutter_auth/views/splash/splash_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Learn net',
      initialRoute: SplashView.routeName,
      onGenerateRoute: RouteUtil.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme(),
    );
  }
}
