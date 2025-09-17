import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lottie/lottie.dart';
import 'package:shartflix/core/constants/app_paddings.dart';
import 'package:shartflix/core/routes/app_routes.dart';
import 'package:shartflix/core/widgets/app_logo_widget.dart';
import 'package:shartflix/core/widgets/custom_button.dart';
import 'package:shartflix/core/widgets/custom_snackbar.dart';
import 'package:shartflix/core/widgets/custom_text_form_field.dart';
import 'package:shartflix/features/auth/presentation/cubit/auth_state.dart';
import 'package:shartflix/features/auth/presentation/widgets/forgot_password_widget.dart';
import 'package:shartflix/core/widgets/gradient_widget.dart';
import 'package:shartflix/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shartflix/features/auth/presentation/widgets/account_container.dart';
import 'package:shartflix/features/auth/presentation/widgets/auth_footer.dart';
import 'package:shartflix/features/auth/presentation/widgets/auth_titles_widget.dart';
import 'package:shartflix/gen/assets.gen.dart';
import 'package:shartflix/src/localization/locale_keys.g.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _mailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _mailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<CustomTextFormField> fieldList = [
      CustomTextFormField(
        controller: _mailController,
        label: LocaleKeys.auth_page_email_txt.tr(),
        prefixIcon: SvgPicture.asset(Assets.svg.mail),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.error_texts_email_isEmpty_txt.tr();
          } else if (!RegExp(
            r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$',
          ).hasMatch(value)) {
            return LocaleKeys.error_texts_email_isValid_txt.tr();
          }
          return null;
        },
      ),
      CustomTextFormField(
        controller: _passwordController,
        label: LocaleKeys.auth_page_password_txt.tr(),
        prefixIcon: SvgPicture.asset(Assets.svg.lock),
        isPasswordField: true,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return LocaleKeys.error_texts_password_isEmpty_txt.tr();
          } else if (value.length < 6) {
            return LocaleKeys.error_texts_password_isValid_txt.tr();
          }
          return null;
        },
      ),
    ];

    return Scaffold(
      body: GradientWidget(
        content: Padding(
          padding: AppPaddings.horizontalP24,
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushReplacementNamed(context, AppRoutes.navBar);
              } else if (state is AuthError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(customSnackbar(title: state.message));
              }
            },
            builder: (context, state) {
              bool isLoading = state is AuthLoading;
              return Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        15.verticalSpace,
                        Lottie.asset(Assets.animations.artboard),
                        AppLogoWidget(),
                        AuthTitlesWidget(
                          title: LocaleKeys.auth_page_login_txt.tr(),
                          subtitle: LocaleKeys.auth_page_login_desc_txt.tr(),
                        ),
                        30.verticalSpace,
                        ...fieldList,
                        ForgotPasswordWidget(),
                        24.verticalSpace,
                        CustomButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<AuthCubit>().login(
                                email: _mailController.text.trim(),
                                password: _passwordController.text,
                              );
                            }
                          },
                          title: LocaleKeys.auth_page_login_txt.tr(),
                          isLoading: isLoading,
                        ),
                        24.verticalSpace,
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          spacing: 15.w,
                          children: [
                            AccountContainer(icon: Assets.svg.google),
                            AccountContainer(icon: Assets.svg.apple),
                            AccountContainer(icon: Assets.svg.facebook),
                          ],
                        ),
                        24.verticalSpace,
                        AuthFooter(
                          title:
                              "${LocaleKeys.auth_page_dont_have_account_txt.tr()} ",
                          subtitle: LocaleKeys.auth_page_register_txt.tr(),
                          routeName: AppRoutes.signup,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
