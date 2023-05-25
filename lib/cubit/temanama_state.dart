import 'package:equatable/equatable.dart';

abstract class TemaState extends Equatable {
  @override
  List<Object> get props => [];
}

class TemaInitial extends TemaState {}

class TemaLoaded extends TemaState {
  final List<String>? temanama;

  TemaLoaded({this.temanama});

  @override
  List<Object> get props => [temanama!];
}

class TemaLoadingFailed extends TemaState {
  final String? message;

  TemaLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
