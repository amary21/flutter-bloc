part of 'image_bloc.dart';

abstract class ImageEvent extends Equatable {
  final String content;
  final int idResult;

  const ImageEvent({required this.content, required this.idResult});

  @override
  List<Object> get props => [];
}

class GetImageList extends ImageEvent {
  const GetImageList({required super.content, required super.idResult});
}
