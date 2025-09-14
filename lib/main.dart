import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shartflix/core/constants/app_strings.dart';
import 'package:shartflix/core/injection/injection.dart';
import 'package:shartflix/core/localization/localization_manager.dart';
import 'package:shartflix/core/providers/app_providers.dart';
import 'package:shartflix/core/routes/app_router.dart';
import 'package:shartflix/core/routes/app_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await configureDependencies();
  runApp(LocalizationManager(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(402, 874),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: AppProviders.appProviderList,
        child: MaterialApp(
          title: AppStrings.appNameTxt,
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          theme: ThemeData(textTheme: GoogleFonts.instrumentSansTextTheme()),
          initialRoute: AppRoutes.splash,
          onGenerateRoute: AppRouter.generateRoute,
        ),
      ),
    );
  }
}
