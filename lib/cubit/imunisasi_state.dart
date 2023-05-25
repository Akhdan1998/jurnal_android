part of 'imunisasi_cubit.dart';

abstract class ImunisasiState extends Equatable {
  @override
  List<Object> get props => [];
}

class ImunisasiInitial extends ImunisasiState {}

class ImunisasiLoaded extends ImunisasiState {
  final List<ImunisasiGroup>? imunisasi;

  ImunisasiLoaded({this.imunisasi});

  @override
  List<Object> get props => [imunisasi!];
}

class ImunisasiLoadingFailed extends ImunisasiState {
  final String? message;

  ImunisasiLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
