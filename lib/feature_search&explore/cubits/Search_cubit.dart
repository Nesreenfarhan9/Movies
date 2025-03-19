import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'Search_State.dart';

class SearchCubit extends Cubit<SearchState> {
  final Dio _dio = Dio();

  SearchCubit() : super(SearchInitial());

  Future<void> searchMovies(String query) async {
    if (query.isEmpty) {
      emit(SearchInitial());
      return;
    }

    emit(SearchLoading());

    try {
      final response = await _dio.get("https://yts.mx/api/v2/list_movies.json?query_term=$query");

      if (response.statusCode == 200) {
        final movies = response.data['data']['movies'] ?? [];
        emit(SearchLoaded(movies));
      } else {
        emit(SearchError("Failed to fetch movies"));
      }
    } catch (e) {
      emit(SearchError("Error: $e"));
    }
  }
}
