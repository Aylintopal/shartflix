import 'package:flutter/material.dart';
import 'package:shartflix/core/routes/app_routes.dart';
import 'package:shartflix/features/auth/presentation/views/login_view.dart';
import 'package:shartflix/features/auth/presentation/views/signup_view.dart';
import 'package:shartflix/features/home/views/home_view.dart';
import 'package:shartflix/features/splash/presentation/views/splash_view.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case AppRoutes.signup:
        return MaterialPageRoute(builder: (_) => const SignUpView());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => const HomeView());
      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
