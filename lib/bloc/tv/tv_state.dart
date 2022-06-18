part of 'tv_bloc.dart';

abstract class TvState extends Equatable {
  const TvState();

  @override
  List<Object> get props => [];
}

class TvInitial extends TvState {}

class TvLoading extends TvState {}

class TvSuccess extends TvState {
  final TvModel tvModel;

  const TvSuccess(this.tvModel);
}

class TvError extends TvState {
  final String? message;

  const TvError(this.message);
}
