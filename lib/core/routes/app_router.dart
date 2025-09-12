import 'package:flutter/material.dart';
import 'package:shartflix/core/routes/app_routes.dart';
import 'package:shartflix/features/auth/views/login_page.dart';
import 'package:shartflix/features/auth/views/signup_page.dart';
import 'package:shartflix/features/home/views/home_page.dart';
import 'package:shartflix/features/splash/views/splash_page.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignUpPage());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
