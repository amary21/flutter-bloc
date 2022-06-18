import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api/api_repository.dart';
import '../../data/model/movie_model.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<GetMovieList>((event, emit) async {
      try {
        emit(MovieLoading());
        final listData = await apiRepository.fetchMovieList();
        emit(MovieSuccess(listData));
        if(listData.error != null){
          emit(MovieError(listData.error));
        }
      } on Error{
        emit(const MovieError("failed to fetch data."));
      }
    });
  }
}
