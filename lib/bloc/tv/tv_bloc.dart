import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api/api_repository.dart';
import '../../data/model/tv_model.dart';

part 'tv_event.dart';
part 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  TvBloc() : super(TvInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<TvEvent>((event, emit) async {
      try {
        emit(TvLoading());
        final listData = await apiRepository.fetchTvList();
        emit(TvSuccess(listData));
        if(listData.error != null){
          emit(TvError(listData.error));
        }
      } on Error{
        emit(const TvError("failed to fetch data."));
      }
    });
  }
}
