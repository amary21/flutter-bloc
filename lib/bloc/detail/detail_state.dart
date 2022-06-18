part of 'detail_bloc.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailSuccess extends DetailState {
  final DetailModel detailModel;
  const DetailSuccess(this.detailModel);
}

class DetailError extends DetailState {
  final String? message;
  const DetailError(this.message);
}
