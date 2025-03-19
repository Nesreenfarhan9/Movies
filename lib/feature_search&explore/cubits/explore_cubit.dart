import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:movies/feature_home/data/models/movie_model.dart';
import 'explore_state.dart';


class ExploreCubit extends Cubit<ExploreState> {
  final Dio _dio = Dio();

  ExploreCubit() : super(ExploreInitial());

  Future<void> fetchMovies() async {
    emit(ExploreLoading());

    try {
      final response = await _dio.get("https://yts.mx/api/v2/list_movies.json");

      if (response.statusCode == 200) {
        final movies = (response.data['data']['movies'] as List)
            .map((json) => Movie.fromJson(json))
            .toList();

        emit(ExploreLoaded(movies));
      } else {
        emit(ExploreError("Failed to load movies"));
      }
    } catch (e) {
      emit(ExploreError("Error: $e"));
    }
  }
}
