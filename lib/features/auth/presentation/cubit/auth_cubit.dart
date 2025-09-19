import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/failure/app_failure.dart';
import 'package:shartflix/features/auth/data/model/auth_response_model.dart';
import 'package:shartflix/features/auth/domain/usecases/auth_usecase.dart';
import 'package:shartflix/features/auth/presentation/cubit/auth_state.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthUsecase authUsecase;

  AuthCubit({required this.authUsecase}) : super(AuthInitial());

  Future<void> login({required String email, required String password}) async {
    emit(AuthLoading());
    final Either<AuthFailure, AuthResponseModel> response = await authUsecase
        .login(email: email, password: password);

    response.fold((failure) {
      final errorMsg = failure.handleException(failure.code);
      emit(AuthError(message: errorMsg));
    }, (user) => {emit(AuthSuccess(user: user))});
  }

  Future<void> register({
    required String email,
    required String name,
    required String password,
  }) async {
    emit(AuthLoading());
    final Either<AuthFailure, AuthResponseModel> response = await authUsecase
        .register(email: email, name: name, password: password);

    response.fold((failure) {
      final errorMsg = failure.handleException(failure.code);
      emit(AuthError(message: errorMsg));
    }, (user) => emit(AuthSuccess(user: user)));
  }
}
