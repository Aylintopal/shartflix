import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/core/constants/app_strings.dart';
import 'package:shartflix/core/constants/app_text_styles.dart';
import 'package:shartflix/core/routes/app_routes.dart';
import 'package:shartflix/core/widgets/app_logo_widget.dart';
import 'package:shartflix/core/widgets/gradient_widget.dart';
import 'package:shartflix/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:shartflix/features/splash/presentation/cubit/splash_state.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool _showLogo = false;
  List<bool> _showLetters = [];

  @override
  void initState() {
    super.initState();
    _showLetters = List.generate(
      AppStrings.appNameTxt.length,
      (index) => false,
    );

    Future.delayed(const Duration(milliseconds: 100), () {
      setState(() => _showLogo = true);

      for (int i = 0; i < _showLetters.length; i++) {
        Future.delayed(Duration(milliseconds: 100 * i), () {
          setState(() => _showLetters[i] = true);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          Future.delayed(const Duration(seconds: 3), () {
            if (state is SplashSuccess) {
              Navigator.pushReplacementNamed(context, AppRoutes.uploadPhoto);
            } else if (state is SplashError) {
              Navigator.pushReplacementNamed(context, AppRoutes.login);
            }
          });
        },
        child: GradientWidget(
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedSlide(
                offset: _showLogo ? Offset.zero : const Offset(0, -0.5),
                duration: const Duration(milliseconds: 2500),
                curve: Curves.easeOutBack,
                child: AnimatedOpacity(
                  opacity: _showLogo ? 1 : 0,
                  duration: const Duration(milliseconds: 600),
                  child: AppLogoWidget(),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(AppStrings.appNameTxt.length, (index) {
                  return AnimatedSlide(
                    offset: _showLetters[index]
                        ? Offset.zero
                        : const Offset(0, 0.5),
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeOut,
                    child: AnimatedOpacity(
                      opacity: _showLetters[index] ? 1 : 0,
                      duration: const Duration(milliseconds: 300),
                      child: Text(
                        AppStrings.appNameTxt[index],
                        style: AppTextStyles.heading3Bold,
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
