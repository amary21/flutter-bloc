part of 'detail_bloc.dart';

abstract class DetailEvent extends Equatable {
  final String content;
  final int idResult;

  const DetailEvent({required this.content, required this.idResult});

  @override
  List<Object> get props => [];
}

class GetDetail extends DetailEvent {
  const GetDetail({required super.content, required super.idResult});
}
