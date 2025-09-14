// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;
import 'package:shartflix/core/network/network_module.dart' as _i472;
import 'package:shartflix/core/network/prefs_module.dart' as _i303;
import 'package:shartflix/features/auth/data/datasource/auth_remote_datasource.dart'
    as _i105;
import 'package:shartflix/features/auth/data/datasource/auth_remote_datasource_impl.dart'
    as _i887;
import 'package:shartflix/features/auth/data/repositories/auth_repository_impl.dart'
    as _i689;
import 'package:shartflix/features/auth/domain/repositories/auth_repository.dart'
    as _i291;
import 'package:shartflix/features/auth/domain/usecases/auth_usecase.dart'
    as _i1060;
import 'package:shartflix/features/auth/presentation/cubit/auth_cubit.dart'
    as _i57;
import 'package:shartflix/features/splash/presentation/cubit/splash_cubit.dart'
    as _i303;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final prefsModule = _$PrefsModule();
    final networkModule = _$NetworkModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => prefsModule.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i361.Dio>(() => networkModule.dio);
    gh.factory<_i303.SplashCubit>(
      () => _i303.SplashCubit(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i105.AuthRemoteDatasource>(
      () => _i887.AuthRemoteDatasourceImpl(gh<_i361.Dio>()),
    );
    gh.lazySingleton<_i291.AuthRepository>(
      () => _i689.AuthRepositoryImpl(
        gh<_i460.SharedPreferences>(),
        authDataSource: gh<_i105.AuthRemoteDatasource>(),
      ),
    );
    gh.factory<_i1060.AuthUsecase>(
      () => _i1060.AuthUsecase(authRepository: gh<_i291.AuthRepository>()),
    );
    gh.factory<_i57.AuthCubit>(
      () => _i57.AuthCubit(authUsecase: gh<_i1060.AuthUsecase>()),
    );
    return this;
  }
}

class _$PrefsModule extends _i303.PrefsModule {}

class _$NetworkModule extends _i472.NetworkModule {}
