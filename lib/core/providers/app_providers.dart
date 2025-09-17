import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shartflix/core/injection/injection.dart';
import 'package:shartflix/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:shartflix/features/home/presentation/cubit/movie_cubit.dart';
import 'package:shartflix/features/splash/presentation/cubit/splash_cubit.dart';
import 'package:shartflix/features/upload_photo/presentation/cubit/upload_photo_cubit.dart';

class AppProviders {
  AppProviders._();

  static final List<BlocProvider> appProviderList = [
    BlocProvider<SplashCubit>(create: (_) => sl<SplashCubit>()),
    BlocProvider<AuthCubit>(create: (_) => sl<AuthCubit>()),
    BlocProvider<MovieCubit>(create: (_) => sl<MovieCubit>()),
    BlocProvider<UploadPhotoCubit>(create: (_) => sl<UploadPhotoCubit>()),
  ];
}
