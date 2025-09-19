import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/features/profile/domain/usecase/profile_usecase.dart';
import 'package:shartflix/features/profile/presentation/cubit/profile_state.dart';

@injectable
class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit({required this.usecase}) : super(ProfileInitial());

  final ProfileUsecase usecase;

  Future<void> getUser() async {
    emit(ProfileLoading());

    final user = await usecase.getUser();

    user.fold(
      (failure) => emit(ProfileError(errorMessage: failure.message)),
      (user) => emit(ProfileLoaded(user: user)),
    );
  }
}
