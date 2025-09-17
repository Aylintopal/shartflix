import 'package:flutter/material.dart';
import 'package:shartflix/core/routes/app_routes.dart';
import 'package:shartflix/features/auth/presentation/views/login_view.dart';
import 'package:shartflix/features/auth/presentation/views/signup_view.dart';
import 'package:shartflix/features/home/presentation/views/bottom_navbar.dart';
import 'package:shartflix/features/splash/presentation/views/splash_view.dart';
import 'package:shartflix/features/upload_photo/presentation/views/upload_photo_view.dart';

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
      case AppRoutes.navBar:
        return MaterialPageRoute(builder: (_) => const CustomBottomNavBar());
      case AppRoutes.uploadPhoto:
        return MaterialPageRoute(builder: (_) => const UploadPhotoView());

      default:
        return MaterialPageRoute(builder: (_) => const Scaffold());
    }
  }
}
