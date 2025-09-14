import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shartflix/features/splash/presentation/cubit/splash_state.dart';

@injectable
class SplashCubit extends Cubit<SplashState> {
  final SharedPreferences preferences;
  SplashCubit(this.preferences) : super(SplashInitial()) {
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    await Future.delayed(Duration(milliseconds: 400));
    final user = preferences.getString('token');

    if (user != null) {
      emit(SplashSuccess(isAuthenticated: true));
    } else {
      emit(SplashError(message: "Kullanıcı bulunamadı"));
    }
  }
}
