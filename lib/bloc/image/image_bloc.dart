import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/api/api_repository.dart';
import '../../data/model/image_model.dart';

part 'image_event.dart';
part 'image_state.dart';

class ImageBloc extends Bloc<ImageEvent, ImageState> {
  ImageBloc() : super(ImageInitial()) {
    final ApiRepository apiRepository = ApiRepository();

    on<ImageEvent>((event, emit) async {
      try {
        emit(ImageLoading());
        final listData = await apiRepository.fetchImageList(event.content, event.idResult);
        emit(ImageSuccess(listData));
        if(listData.error != null){
          emit(ImageError(listData.error));
        }
      } on Error{
        emit(const ImageError("failed to fetch data."));
      }
    });
  }
}
