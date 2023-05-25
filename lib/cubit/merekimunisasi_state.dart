part of 'merekimunisasi_cubit.dart';

abstract class MerekimunisasiState extends Equatable {
  @override
  List<Object> get props => [];
}

class MerekimunisasiInitial extends MerekimunisasiState {}

class MerekLoaded extends MerekimunisasiState {
  final List<MerekImunisasi>? merekImun;

  MerekLoaded({this.merekImun});

  @override
  List<Object> get props => [merekImun!];
}

class MerekLoadingFailed extends MerekimunisasiState {
  final String? message;

  MerekLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
