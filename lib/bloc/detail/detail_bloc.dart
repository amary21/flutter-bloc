import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api/api_repository.dart';
import '../../data/model/detail_model.dart';

part 'detail_event.dart';
part 'detail_state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  DetailBloc() : super(DetailInitial()) {
    final ApiRepository apiRepository = ApiRepository();
    on<DetailEvent>((event, emit) async {
      try {
        emit(DetailLoading());
        final data =
            await apiRepository.fetchDetail(event.content, event.idResult);
        emit(DetailSuccess(data));
        if (data.error != null) {
          emit(DetailError(data.error));
        }
      } on Error {
        emit(const DetailError("failed to fetch data."));
      }
    });
  }
}
