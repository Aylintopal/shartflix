import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shartflix/core/failure/app_failure.dart';
import 'package:shartflix/core/models/movie_model.dart';
import 'package:shartflix/features/profile/presentation/cubit/favorite_state.dart';
import 'package:shartflix/features/profile/domain/usecase/profile_usecase.dart';

@injectable
class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit({required this.profileUsecase}) : super(FavoriteInitial());

  final ProfileUsecase profileUsecase;

  Future<void> getFavorites() async {
    emit(FavoriteLoading());

    final Either<AppFailure, List<MovieModel>?> favorites =
        await profileUsecase.getFavorites();

    favorites.fold(
      (failure) => emit(FavoriteError(message: failure.message)),
      (favorites) => emit(FavoriteLoaded(favorites: favorites)),
    );
  }

  Future<void> setFavorites({required String favoriteId}) async {
    final Either<AppFailure, Map<String, dynamic>> favorites =
        await profileUsecase.setFavorites(favoriteId: favoriteId);

    favorites.fold((failure) => emit(FavoriteError(message: failure.message)), (
      favorites,
    ) {
      emit(FavoriteAdded(message: favoriteId));
    });
  }
}
