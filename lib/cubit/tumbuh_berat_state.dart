import 'package:equatable/equatable.dart';

import '../Models/model_tumbuhBerat.dart';

abstract class TumbuhBeratState extends Equatable {
  @override
  List<Object> get props => [];
}

class TumbuhBeratInitial extends TumbuhBeratState {}

class TumbuhBeratLoaded extends TumbuhBeratState {
  final List<TumbuhBerat>? tumbuhBerat;

  TumbuhBeratLoaded({this.tumbuhBerat});

  @override
  List<Object> get props => [tumbuhBerat!];
}

class TumbuhBeratLoadingFailed extends TumbuhBeratState {
  final String? message;

  TumbuhBeratLoadingFailed(this.message);

  @override
  List<Object> get props => [message!];
}
