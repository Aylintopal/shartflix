import 'package:shartflix/features/home/data/models/movie_pagination_model.dart';

abstract class MovieRemoteDatasource {
  Future<MoviePaginationModel> getPaginatedList({required int page});
}
